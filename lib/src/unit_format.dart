import 'package:collection/collection.dart';
import 'package:measure/measure.dart';

import 'package:petitparser/petitparser.dart';
import 'package:intl/intl.dart';

abstract class UnitFormat {
  /// Holds the standard unit format.
  static final UnitFormat standardUnitFormat = _DefaultUnitFormat();

  /// Holds the ASCII unit format.
  static final UnitFormat asciiUnitFormat = _ASCIIUnitFormat();

  static final Map<String, UnitFormat> _localeFormats = {};

  /// Returns the unit format for the specified locale.
  static UnitFormat getInstance([String? inLocale]) => inLocale == null
      ? standardUnitFormat
      : _localeFormats.putIfAbsent(
          inLocale, () => _DefaultUnitFormat(inLocale));

  /// Returns the [UCUM](http://aurora.regenstrief.org/UCUM/ucum.html)
  /// international unit format; this format uses characters range
  /// `0000-007F` exclusively and is not locale-sensitive.
  ///
  /// For example: `kg.m/s2`
  static UnitFormat getUCUMInstance() {
    return UnitFormat.asciiUnitFormat; // TBD - Provide UCUM implementation.
  }

  /// Holds the name to unit mapping.
  final Map<String, Unit> _nameToUnit = {};

  /// Holds the unit to name mapping.
  final Map<Unit, String> _unitToName = {};

  /// Formats the specified unit.
  String format(Unit unit) {
    var name = nameFor(unit);
    if (name != null) return name;

    if (unit is UnitForQuantity) unit = unit.parent;
    if (unit is ProductUnit) {
      var posExponents = unit.elements
          .where((e) => e.pow.dividend >= 0)
          .map(
              (e) => _formatPow(nameFor(e.base), e.pow.dividend, e.pow.divisor))
          .join('·');

      var negExponents = unit.elements.where((e) => e.pow.dividend < 0).map(
          (e) => _formatPow(nameFor(e.base), -e.pow.dividend, e.pow.divisor));

      if (negExponents.isEmpty) return posExponents;
      if (posExponents.isEmpty) posExponents = '1';
      if (negExponents.length == 1) {
        return '$posExponents/${negExponents.join('·')}';
      }

      return '$posExponents/(${negExponents.join('·')})';
    }

    throw ArgumentError('Cannot format given Object as a Unit');
  }

  /// Parses a string to produce a unit or a rational product of unit.
  Unit parseProductUnit(String input) =>
      productUnitParser.end().parse(input).value;

  /// Parses a string to produce a single unit.
  Unit parseSingleUnit(String input) =>
      singleUnitParser.end().parse(input).value;

  /// Attaches a system-wide label to the specified unit.
  ///
  /// If the specified label is already associated to an unit the previous
  /// association is discarded or ignored.
  void label(Unit unit, String label) {
    if (!isValidIdentifier(label)) {
      throw ArgumentError('Label: $label is not a valid identifier.');
    }
    _nameToUnit[label] = unit;
    _unitToName[unit] = label;
  }

  /// Attaches a system-wide alias to this unit.
  ///
  /// Multiple aliases may be attached to the same unit. Aliases are used during
  /// parsing to recognize different variants of the same unit.
  ///
  /// If the specified label is already associated to an unit the previous
  /// association is discarded or ignored.
  void alias(Unit unit, String alias) {
    if (!isValidIdentifier(alias)) {
      throw ArgumentError('Alias: $alias is not a valid identifier.');
    }
    _nameToUnit[alias] = unit;
  }

  /// Indicates if the specified name can be used as unit identifier.
  bool isValidIdentifier(String name) => _unitIdentifier.end().accept(name);

  /// Returns the name for the specified unit or null if product unit.
  String? nameFor(Unit unit) {
    // Searches label database.
    var label = _unitToName[unit];
    if (label != null) return label;
    if (unit is BaseUnit) return unit.symbol;
    if (unit is AlternateUnit) return unit.symbol;
    if (unit is TransformedUnit) {
      var baseUnits = unit.standardUnit;
      var cvtr = unit.toStandardUnit();
      var result = StringBuffer();
      var baseUnitName = format(baseUnits);

      if (baseUnitName.contains('·') ||
          baseUnitName.contains('*') ||
          baseUnitName.contains('/')) {
        // We could use parentheses whenever baseUnits is an
        // is ProductUnit, but most ProductUnits have aliases,
        // so we'd end up with a lot of unnecessary parentheses.
        result.write('($baseUnitName)');
      } else {
        result.write(baseUnitName);
      }
      if (cvtr is AddConverter) {
        result.write('+${cvtr.offset}');
      } else if (cvtr is RationalConverter) {
        var dividend = cvtr.factor.dividend;
        if (dividend != 1) {
          result.write('*$dividend');
        }
        var divisor = cvtr.factor.divisor;
        if (divisor != 1) {
          result.write('/$divisor');
        }
      } else if (cvtr is MultiplyConverter) {
        result.write('*${cvtr.factor}');
      } else {
        // Other converters.
        return '[$baseUnits?]';
      }
      return result.toString();
    }
    return null; // Product unit.
  }

  /// Returns the unit for the specified name.
  Unit? unitFor(String name) =>
      _nameToUnit[name] ?? SI.unitsBySymbol[name] ?? NonSI.unitsBySymbol[name];

  /// Returns a typed parser that produces a single unit.
  Parser<Unit> get singleUnitParser =>
      _mapParser(_unitIdentifier, (dynamic name) {
        var unit = unitFor(name);
        if (unit == null) return failure('$name not recognized');
        return EpsilonParser(unit);
      });

  /// Returns a typed parser that produces a unit or a rational product of unit.
  Parser<Unit> get productUnitParser {
    var term = undefined<Unit>();

    var paren =
        (char('(').trim() & term & char(')').trim()).pick(1).cast<Unit>();

    var e = (anyOf('^¹²³').and() & _exponent).pick(1).cast<RationalNumber>();

    var base =
        paren | singleUnitParser | _integer().map((v) => Unit.one.scaled(v));

    var element = (base & e.optionalWith(RationalNumber.one))
        .map((l) => RationalPower<Unit>(l[0], l[1]));

    var divisor = (char('/') & element).pick(1).map((v) => v.inverse);
    var factor = (element & divisor.star()).map(
        (l) => ProductUnit([l[0], ...(l[1] as Iterable).cast()]).simplify());
    term.set(factor.plusSeparated(char('*')).map((l) => l.elements.length == 1
        ? l.elements.first
        : ProductUnit(l.elements.map((v) => RationalPower(v)))));

    var number =
        _mapParser(anyOf('012356789+-.E').plus().flatten(), (dynamic v) {
      try {
        return epsilonWith(num.parse(v));
      } catch (e) {
        return failure('$e');
      }
    });
    return (term & (char('+') & number).pick(1).optional())
        .map((l) => l[1] == null ? l[0] : l[0].plus(l[1]))
        .map((v) {
      if (v is ProductUnit) {
        var u = Quantities.values
            .map((v) => v.siUnit)
            .firstWhereOrNull((u) => u is UnitForQuantity && u.parent == v);
        if (u != null) return u;
      }
      return v;
    });
  }

  static Parser<String> get _unitIdentifier =>
      _unitIdentifierChar.plus().flatten();

  static Parser<String> get _unitIdentifierChar =>
      (whitespace() | digit() | anyOf('·*/()[]¹²³^+-;<>{}|&!?=:,')).neg();

  Parser<RationalNumber> get _exponent {
    var def = char('^') | string('**');
    var extendedDigit = digit() |
        anyOf('¹²³').map((v) => const {'¹': '1', '²': '2', '³': '3'}[v]);
    var positiveInteger =
        extendedDigit.plus().map((l) => l.join()).map(int.parse);
    var sign = char('-').map((_) => -1).optionalWith(1);
    var integer = (sign & positiveInteger).map((l) => l[0] * l[1]);
    return (def.optional() &
            (integer & (char(':') & integer).pick(1).optionalWith(1))
                .map((l) => RationalNumber(l[0], l[1])))
        .pick(1)
        .cast();
  }

  String? _formatPow(String? symbol, int pow, int root) {
    // TODO move to rational pow
    if ((pow != 1) || (root != 1)) {
      // Write exponent.
      if ((pow == 2) && (root == 1)) {
        return '$symbol²'; // Square
      } else if ((pow == 3) && (root == 1)) {
        return '$symbol³'; // Cubic
      } else {
        // Use general exponent form.
        if (root == 1) return '$symbol^$pow';

        return '$symbol^$pow:$root';
      }
    }
    return symbol;
  }
}

/// This class represents the standard format.
class _DefaultUnitFormat extends UnitFormat {
  ////////////////////////////////////////////////////////////////////////////
  // Initializes the standard unit database for SI units.
  static const List<Unit> siUnits = [
    SI.ampere,
    SI.becquerel,
    SI.candela,
    SI.coulomb,
    SI.farad,
    SI.gray,
    SI.henry,
    SI.hertz,
    SI.joule,
    SI.katal,
    SI.kelvin,
    SI.lumen,
    SI.lux,
    SI.metre,
    SI.mole,
    SI.newton,
    SI.ohm,
    SI.pascal,
    SI.radian,
    SI.second,
    SI.siemens,
    SI.sievert,
    SI.steradian,
    SI.tesla,
    SI.volt,
    SI.watt,
    SI.weber
  ];

  static const List<String> prefixes = [
    'Y',
    'Z',
    'E',
    'P',
    'T',
    'G',
    'M',
    'k',
    'h',
    'da',
    'd',
    'c',
    'm',
    'µ',
    'n',
    'p',
    'f',
    'a',
    'z',
    'y'
  ];

  static const List<UnitConverter> converters = [
    SI.e24,
    SI.e21,
    SI.e18,
    SI.e15,
    SI.e12,
    SI.e9,
    SI.e6,
    SI.e3,
    SI.e2,
    SI.e1,
    SI.em1,
    SI.em2,
    SI.em3,
    SI.em6,
    SI.em9,
    SI.em12,
    SI.em15,
    SI.em18,
    SI.em21,
    SI.em24
  ];

  _DefaultUnitFormat([String? locale]) {
    for (var i = 0; i < siUnits.length; i++) {
      for (var j = 0; j < prefixes.length; j++) {
        var si = siUnits[i];
        var u = si.transform(converters[j]);
        var symbol = si is BaseUnit ? si.symbol : (si as AlternateUnit).symbol;

        label(u, prefixes[j] + symbol);
      }
    }

    // Special case for KILOGRAM.
    label(SI.gram, 'g');
    for (var i = 0; i < prefixes.length; i++) {
      if (converters[i] == SI.e3) continue; // kg is already defined.
      label(SI.kilogram.transform(converters[i].concatenate(SI.em3)),
          '${prefixes[i]}g');
    }

    // Alias and ASCIIFormat for Ohm
    alias(SI.ohm, 'Ohm');
    for (var i = 0; i < prefixes.length; i++) {
      alias(SI.ohm.transform(converters[i]), '${prefixes[i]}Ohm');
    }

    // Special case for DEGREE_CElSIUS.
    label(SI.celsius, '℃');
    alias(SI.celsius, '°C');
    for (var i = 0; i < prefixes.length; i++) {
      label(SI.celsius.transform(converters[i]), '${prefixes[i]}℃');
      alias(SI.celsius.transform(converters[i]), '${prefixes[i]}°C');
    }

    ////////////////////////////////////////////////////////////////////////////
    // To be moved in resource bundle in future release (locale dependent).
    label(NonSI.percent, '%');
    label(NonSI.decibel, 'dB');
    label(NonSI.g, 'grav');
    label(NonSI.atom, 'atom');
    label(NonSI.revolution, 'rev');
    label(NonSI.degreeAngle, '°');
    label(NonSI.minuteAngle, "'");
    label(NonSI.secondAngle, '\'');
    label(NonSI.centiradian, 'centiradian');
    label(NonSI.grade, 'grade');
    label(NonSI.are, 'a');
    label(NonSI.hectare, 'ha');
    label(NonSI.byte, 'byte');
    label(NonSI.minute, 'min');
    label(NonSI.hour, 'h');
    label(NonSI.day, 'day');
    label(NonSI.week, 'week');
    label(NonSI.year, 'year');
    label(NonSI.month, 'month');
    label(NonSI.daySidereal, 'day_sidereal');
    label(NonSI.yearSidereal, 'year_sidereal');
    label(NonSI.yearCalendar, 'year_calendar');
    label(NonSI.e, 'e');
    label(NonSI.faraday, 'Fd');
    label(NonSI.franklin, 'Fr');
    label(NonSI.gilbert, 'Gi');
    label(NonSI.erg, 'erg');
    label(NonSI.electronVolt, 'eV');
    label(SI.kilo(NonSI.electronVolt), 'keV');
    label(SI.mega(NonSI.electronVolt), 'MeV');
    label(SI.giga(NonSI.electronVolt), 'GeV');
    label(NonSI.lambert, 'La');
    label(NonSI.foot, 'ft');
    label(NonSI.footSurveyUS, 'foot_survey_us');
    label(NonSI.yard, 'yd');
    label(NonSI.inch, 'in');
    label(NonSI.mile, 'mi');
    label(NonSI.nauticalMile, 'nmi');
    label(NonSI.milesPerHour, 'mph');
    label(NonSI.angstrom, 'Å');
    label(NonSI.astronomicalUnit, 'ua');
    label(NonSI.lightYear, 'ly');
    label(NonSI.parsec, 'pc');
    label(NonSI.point, 'pt');
    label(NonSI.pixel, 'pixel');
    label(NonSI.maxwell, 'Mx');
    label(NonSI.gauss, 'G');
    label(NonSI.atomicMass, 'u');
    label(NonSI.electronMass, 'me');
    label(NonSI.pound, 'lb');
    label(NonSI.ounce, 'oz');
    label(NonSI.tonUS, 'ton_us');
    label(NonSI.tonUK, 'ton_uk');
    label(NonSI.metricTon, 't');
    label(NonSI.dyne, 'dyn');
    label(NonSI.kilogramForce, 'kgf');
    label(NonSI.poundForce, 'lbf');
    label(NonSI.horsepower, 'hp');
    label(NonSI.atmosphere, 'atm');
    label(NonSI.bar, 'bar');
    label(NonSI.millimeterOfMercury, 'mmHg');
    label(NonSI.inchOfMercury, 'inHg');
    label(NonSI.rad, 'rd');
    label(NonSI.rem, 'rem');
    label(NonSI.curie, 'Ci');
    label(NonSI.rutherford, 'Rd');
    label(NonSI.sphere, 'sphere');
    label(NonSI.rankine, '°R');
    label(NonSI.fahrenheit, '°F');
    label(NonSI.knot, 'kn');
    label(NonSI.mach, 'Mach');
    label(NonSI.c, 'c');
    label(NonSI.litre, 'L');
    label(SI.micro(NonSI.litre), 'µL');
    label(SI.milli(NonSI.litre), 'mL');
    label(SI.centi(NonSI.litre), 'cL');
    label(SI.deci(NonSI.litre), 'dL');
    label(NonSI.gallonLiquidUS, 'gal');
    label(NonSI.ounceLiquidUS, 'oz');
    label(NonSI.gallonDryUS, 'gallon_dry_us');
    label(NonSI.gallonUK, 'gallon_uk');
    label(NonSI.ounceLiquidUK, 'oz_uk');
    label(NonSI.roentgen, 'Roentgen');
    if (Intl.shortLocale(locale ?? Intl.defaultLocale ?? Intl.systemLocale) ==
        'GB') {
      label(NonSI.gallonUK, 'gal');
      label(NonSI.ounceLiquidUK, 'oz');
    }
  }
}

/// This class represents the ASCIIFormat format.
class _ASCIIUnitFormat extends UnitFormat {
  static String _asciiPrefix(String prefix) {
    return prefix == 'µ' ? 'micro' : prefix;
  }

  _ASCIIUnitFormat() {
    var microIndex = _DefaultUnitFormat.prefixes.indexOf('µ');
    var microCvtr = _DefaultUnitFormat.converters[microIndex];

    for (var si in _DefaultUnitFormat.siUnits) {
      var u = si.transform(microCvtr);
      var symbol = si is BaseUnit ? si.symbol : (si as AlternateUnit).symbol;
      label(u, 'micro$symbol');
    }

    // Special case for KILOGRAM.
    label(SI.kilogram.transform(microCvtr.concatenate(SI.em3)), 'microg');

    // Alias and ASCIIFormat for Ohm
    label(SI.ohm, 'Ohm');
    for (var i = 0; i < _DefaultUnitFormat.prefixes.length; i++) {
      label(SI.ohm.transform(_DefaultUnitFormat.converters[i]),
          '${_asciiPrefix(_DefaultUnitFormat.prefixes[i])}Ohm');
    }

    // Special case for DEGREE_CElSIUS.
    label(SI.celsius, 'Celsius');
    for (var i = 0; i < _DefaultUnitFormat.prefixes.length; i++) {
      label(SI.celsius.transform(_DefaultUnitFormat.converters[i]),
          '${_asciiPrefix(_DefaultUnitFormat.prefixes[i])}Celsius');
    }

    ////////////////////////////////////////////////////////////////////////////
    // To be moved in resource bundle in future release (locale dependent).
    label(NonSI.degreeAngle, 'degree_angle');
    label(NonSI.angstrom, 'Angstrom');
    label(NonSI.rankine, 'degree_rankine');
    label(NonSI.fahrenheit, 'degree_fahrenheit');
    label(SI.micro(NonSI.litre), 'microL');
  }

  @override
  String? nameFor(Unit unit) =>
      _unitToName[unit] ?? UnitFormat.standardUnitFormat.nameFor(unit);

  @override
  Unit? unitFor(String name) =>
      _nameToUnit[name] ?? UnitFormat.standardUnitFormat.unitFor(name);
}

Parser<S> _mapParser<S, T>(Parser<T> parser, Parser<S> Function(T) mapper) {
  var followedBy = undefined<S>();
  return parser
      .map<T>((v) {
        var p = mapper(v);
        followedBy.set(p);
        return v;
      })
      .seq(followedBy)
      .map((l) => l[1]);
}

Parser<int> _positiveInteger() => digit().plus().flatten().map(int.parse);

Parser<int> _sign() => anyOf('-+').map((v) => v == '+' ? 1 : -1);

Parser<int> _integer() =>
    ((_sign() & whitespace().star()).pick(1).cast<int>().optionalWith(1) &
            _positiveInteger())
        .map((l) => l[0] * l[1]);

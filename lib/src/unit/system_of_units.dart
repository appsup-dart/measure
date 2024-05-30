part of measure.unit;

/// A system of units.
///
/// It groups units together for historical or cultural reasons. Nothing
/// prevents a unit from belonging to several system of units at the same time
/// (for example an imperial system would have many of the units held by
/// [NonSI]).
abstract class SystemOfUnits {
  const SystemOfUnits();

  /// A read only view over the units defined in this system.
  List<Unit> get units;
}

/// Contains SI (Système International d'Unités) base units, and derived units.
///
/// It also defines the 20 SI prefixes used to form decimal multiples and
/// submultiples of SI units.
abstract class SI extends SystemOfUnits {
  const SI._();

  static const Map<String, Unit> unitsBySymbol = {
    'A': ampere,
    'cd': candela,
    'K': kelvin,
    'kg': kilogram,
    'm': metre,
    'mol': mole,
    's': second,
    'g': gram,
    'rad': radian,
    'sr': steradian,
    'bit': bit,
    'Hz': hertz,
    'N': newton,
    'Pa': pascal,
    'J': joule,
    'W': watt,
    'C': coulomb,
    'V': volt,
    'F': farad,
    'Ω': ohm,
    'S': siemens,
    'Wb': weber,
    'T': tesla,
    'H': henry,
    '℃': celsius,
    'lm': lumen,
    'lx': lux,
    'Bq': becquerel,
    'Gy': gray,
    'Sv': sievert,
    'kat': katal,
  };

  ////////////////
  // BASE UNITS //
  ////////////////

  /// The base unit for electric current quantities (`A`).
  ///
  /// The Ampere is that constant current which, if maintained in two straight
  /// parallel conductors of infinite length, of negligible circular
  /// cross-section, and placed 1 metre apart in vacuum, would produce between
  /// these conductors a force equal to 2 × 10-7 newton per metre of length.
  ///
  /// It is named after the French physicist Andre Ampere (1775-1836).
  static const BaseUnit ampere = BaseUnit('A', Quantities.electricCurrent);

  /// The base unit for luminous intensity quantities (`cd`).
  ///
  /// The candela is the luminous intensity, in a given direction,
  /// of a source that emits monochromatic radiation of frequency
  /// 540 × 1012 hertz and that has a radiant intensity in that
  /// direction of 1/683 watt per steradian.
  static const BaseUnit candela = BaseUnit('cd', Quantities.luminousIntensity);

  /// The base unit for thermodynamic temperature quantities (`K`).
  ///
  /// The kelvin is the 1/273.16th of the thermodynamic temperature of the
  /// triple point of water. It is named after the Scottish mathematician and
  /// physicist William Thomson 1st Lord Kelvin (1824-1907)
  static const BaseUnit kelvin = BaseUnit('K', Quantities.temperature);

  /// The base unit for mass quantities (`kg`).
  ///
  /// It is the only SI unit with a prefix as part of its name and symbol.
  /// The kilogram is equal to the mass of an international prototype in the
  /// form of a platinum-iridium cylinder kept at Sevres in France.
  static const BaseUnit kilogram = BaseUnit('kg', Quantities.mass);

  /// The base unit for length quantities (`m`).
  ///
  /// One meter was redefined in 1983 as the distance traveled by light in
  /// a vacuum in 1/299,792,458 of a second.
  static const BaseUnit metre = BaseUnit('m', Quantities.length);

  /// Equivalent to [metre] (American spelling).
  static const Unit meter = metre;

  /// The base unit for amount of substance quantities (`mol`).
  ///
  /// The mole is the amount of substance of a system which contains as many
  /// elementary entities as there are atoms in 0.012 kilogram of carbon 12.
  static const BaseUnit mole = BaseUnit('mol', Quantities.amountOfSubstance);

  /// The base unit for duration quantities (`s`).
  ///
  /// It is defined as the duration of 9,192,631,770 cycles of radiation
  /// corresponding to the transition between two hyperfine levels of
  /// the ground state of cesium (1967 Standard).
  static const BaseUnit second = BaseUnit('s', Quantities.duration);

  ////////////////////////////////
  // SI DERIVED ALTERNATE UNITS //
  ////////////////////////////////

  /// The derived unit for mass quantities (`g`).
  ///
  /// The base unit for mass Quantities.is [kilogram].
  static const Unit gram = TransformedUnit(kilogram, Em3);

  /// The unit for plane angle quantities (`rad`).
  ///
  /// One radian is the angle between two radii of a circle such that the
  /// length of the arc between them is equal to the radius.
  static const AlternateUnit radian =
      AlternateUnit('rad', Unit.one, Quantities.angle);

  /// The unit for solid angle quantities (`sr`).
  ///
  /// One steradian is the solid angle subtended at the center of a sphere by
  /// an area on the surface of the sphere that is equal to the radius squared.
  /// The total solid angle of a sphere is 4*Pi steradians.
  static const AlternateUnit steradian =
      AlternateUnit('sr', Unit.one, Quantities.solidAngle);

  /// The unit for binary information (`bit`).
  static const AlternateUnit bit =
      AlternateUnit('bit', Unit.one, Quantities.dataAmount);

  /// The derived unit for frequency (`Hz`).
  ///
  /// A unit of frequency equal to one cycle per second.
  /// After Heinrich Rudolf Hertz (1857-1894), German physicist who was the
  /// first to produce radio waves artificially.
  static const AlternateUnit hertz = AlternateUnit(
      'Hz',
      ProductUnit._([RationalPower<Unit>(second, RationalNumber._(-1))]),
      Quantities.frequency);

  /// The derived unit for force (`N`).
  ///
  /// One newton is the force required to give a mass of 1 kilogram an Force
  /// of 1 metre per second per second. It is named after the English
  /// mathematician and physicist Sir Isaac Newton (1642-1727).
  static const AlternateUnit newton = AlternateUnit(
      'N',
      ProductUnit._([
        RationalPower(metre),
        RationalPower(kilogram),
        RationalPower(second, RationalNumber._(-2))
      ]),
      Quantities.force);

  /// The derived unit for pressure, stress (`Pa`).
  ///
  /// One pascal is equal to one newton per square meter. It is named after
  /// the French philosopher and mathematician Blaise Pascal (1623-1662).
  static const AlternateUnit pascal = AlternateUnit(
      'Pa',
      ProductUnit._([
        RationalPower<Unit>(newton),
        RationalPower<Unit>(metre, RationalNumber._(-2))
      ]),
      Quantities.pressure);

  /// The derived unit for energy, work, Quantities.of heat (`J`).
  ///
  /// One joule is the amount of work done when an applied force of 1 newton
  /// moves through a distance of 1 metre in the direction of the force.
  /// It is named after the English physicist James Prescott Joule (1818-1889).
  static const AlternateUnit joule = AlternateUnit(
      'J',
      ProductUnit._([RationalPower<Unit>(newton), RationalPower<Unit>(metre)]),
      Quantities.energy);

  /// The derived unit for power, radiant, flux (`W`).
  ///
  /// One watt is equal to one joule per second. It is named after the British
  /// scientist James Watt (1736-1819).
  static const AlternateUnit watt = AlternateUnit(
      'W',
      ProductUnit._([
        RationalPower<Unit>(joule),
        RationalPower<Unit>(second, RationalNumber._(-1))
      ]),
      Quantities.power);

  /// The derived unit for electric charge, Quantities.of electricity
  /// (`C`).
  ///
  /// One Coulomb is equal to the Quantities.of charge transferred in one second
  /// by a steady current of one ampere. It is named after the French physicist
  /// Charles Augustin de Coulomb (1736-1806).
  static const AlternateUnit coulomb = AlternateUnit(
      'C',
      ProductUnit._([RationalPower(second), RationalPower(ampere)]),
      Quantities.electricCharge);

  /// The derived unit for electric potential difference, electromotive force
  /// (`V`).
  ///
  /// One Volt is equal to the difference of electric potential between two
  /// points on a conducting wire carrying a constant current of one ampere
  /// when the power dissipated between the points is one watt. It is named
  /// after the Italian physicist Count Alessandro Volta (1745-1827).
  static const AlternateUnit volt = AlternateUnit(
      'V',
      ProductUnit._([
        RationalPower<Unit>(watt),
        RationalPower<Unit>(ampere, RationalNumber._(-1))
      ]),
      Quantities.electricPotential);

  /// The derived unit for capacitance (`F`).
  ///
  /// One Farad is equal to the capacitance of a capacitor having an equal
  /// and opposite charge of 1 coulomb on each plate and a potential difference
  /// of 1 volt between the plates. It is named after the British physicist
  /// and chemist Michael Faraday (1791-1867).
  static const AlternateUnit farad = AlternateUnit(
      'F',
      ProductUnit._(
          [RationalPower(coulomb), RationalPower(volt, RationalNumber._(-1))]),
      Quantities.electricCapacitance);

  /// The derived unit for electric resistance (`Ω` or `Ohm`).
  ///
  /// One Ohm is equal to the resistance of a conductor in which a current of
  /// one ampere is produced by a potential of one volt across its terminals.
  /// It is named after the German physicist Georg Simon Ohm (1789-1854).
  static const AlternateUnit ohm = AlternateUnit(
      'Ω',
      ProductUnit._([
        RationalPower<Unit>(volt),
        RationalPower<Unit>(ampere, RationalNumber._(-1))
      ]),
      Quantities.electricResistance);

  /// The derived unit for electric conductance (`S`).
  ///
  /// One Siemens is equal to one ampere per volt. It is named after
  /// the German engineer Ernst Werner von Siemens (1816-1892).
  static const AlternateUnit siemens = AlternateUnit(
      'S',
      ProductUnit._([
        RationalPower<Unit>(ampere),
        RationalPower<Unit>(volt, RationalNumber._(-1))
      ]),
      Quantities.electricConductance);

  /// The derived unit for magnetic flux (`Wb`).
  ///
  /// One Weber is equal to the magnetic flux that in linking a circuit of one
  /// turn produces in it an electromotive force of one volt as it is uniformly
  /// reduced to zero within one second. It is named after the German physicist
  /// Wilhelm Eduard Weber (1804-1891).
  static const AlternateUnit weber = AlternateUnit(
      'Wb',
      ProductUnit._([RationalPower<Unit>(volt), RationalPower<Unit>(second)]),
      Quantities.magneticFlux);

  /// The derived unit for magnetic flux density (`T`).
  ///
  /// One Tesla is equal equal to one weber per square meter. It is named
  /// after the Serbian-born American electrical engineer and physicist
  /// Nikola Tesla (1856-1943).
  static const AlternateUnit tesla = AlternateUnit(
      'T',
      ProductUnit._([
        RationalPower<Unit>(weber),
        RationalPower<Unit>(metre, RationalNumber._(-2))
      ]),
      Quantities.magneticFluxDensity);

  /// The derived unit for inductance (`H`).
  ///
  /// One Henry is equal to the inductance for which an induced electromotive
  /// force of one volt is produced when the current is varied at the rate of
  /// one ampere per second. It is named after the American physicist
  /// Joseph Henry (1791-1878).
  static const AlternateUnit henry = AlternateUnit(
      'H',
      ProductUnit._([
        RationalPower<Unit>(weber),
        RationalPower<Unit>(ampere, RationalNumber._(-1))
      ]),
      Quantities.electricInductance);

  /// The derived unit for Celsius temperature (`℃`).
  ///
  /// This is a unit of temperature such as the freezing point of water
  /// (at one atmosphere of pressure) is 0 ℃, while the boiling point is
  /// 100 ℃.
  static const Unit celsius = AlternateUnit('℃',
      TransformedUnit(kelvin, AddConverter._(273.15)), Quantities.temperature);

  /// The derived unit for luminous flux (`lm`).
  ///
  /// One Lumen is equal to the amount of light given out through a solid angle
  /// by a source of one candela intensity radiating equally in all directions.
  static const AlternateUnit lumen = AlternateUnit(
      'lm',
      ProductUnit._(
          [RationalPower<Unit>(candela), RationalPower<Unit>(steradian)]),
      Quantities.luminousFlux);

  /// The derived unit for illuminance (`lx`).
  ///
  /// One Lux is equal to one lumen per square meter.
  static const AlternateUnit lux = AlternateUnit(
      'lx',
      ProductUnit._([
        RationalPower<Unit>(lumen),
        RationalPower<Unit>(meter, RationalNumber._(-2))
      ]),
      Quantities.illuminance);

  /// The derived unit for activity of a radionuclide (`Bq`).
  ///
  /// One becquerel is the radiation caused by one disintegration per second.
  /// It is named after the French physicist, Antoine-Henri Becquerel
  /// (1852-1908).
  static const AlternateUnit becquerel = AlternateUnit(
      'Bq',
      ProductUnit._([
        RationalPower<Unit>(Unit.one),
        RationalPower<Unit>(second, RationalNumber._(-1))
      ]),
      Quantities.radioactiveActivity);

  /// The derived unit for absorbed dose, specific energy (imparted), kerma
  /// (`Gy`).
  ///
  /// One gray is equal to the dose of one joule of energy absorbed per one
  /// kilogram of matter. It is named after the British physician
  /// L. H. Gray (1905-1965).
  static const AlternateUnit gray = AlternateUnit(
      'Gy',
      ProductUnit._([
        RationalPower<Unit>(joule),
        RationalPower<Unit>(kilogram, RationalNumber._(-1))
      ]),
      Quantities.radiationDoseAbsorbed);

  /// The derived unit for dose equivalent (`Sv`).
  ///
  /// One Sievert is equal  is equal to the actual dose, in grays, multiplied
  /// by a 'quality factor' which is larger for more dangerous forms of
  /// radiation. It is named after the Swedish physicist Rolf Sievert
  /// (1898-1966).
  static const AlternateUnit sievert = AlternateUnit(
      'Sv',
      ProductUnit._([
        RationalPower<Unit>(joule),
        RationalPower<Unit>(kilogram, RationalNumber._(-1))
      ]),
      Quantities.radiationDoseEffective);

  /// The derived unit for catalytic activity (`kat`).
  static const AlternateUnit katal = AlternateUnit(
      'kat',
      ProductUnit._([
        RationalPower<Unit>(mole),
        RationalPower<Unit>(second, RationalNumber._(-1))
      ]),
      Quantities.catalyticActivity);

  //////////////////////////////
  // SI DERIVED PRODUCT UNITS //
  //////////////////////////////

  /// The metric unit for velocity quantities (`m/s`).
  static const Unit metresPerSecond = UnitForQuantity(
      ProductUnit._([
        RationalPower<Unit>(metre),
        RationalPower<Unit>(second, RationalNumber._(-1))
      ]),
      Quantities.velocity);

  /// Equivalent to [metresPerSecond] (American spelling).
  static const Unit metersPerSecond = metresPerSecond;

  /// The metric unit for acceleration quantities (`m/s²`).
  static const Unit metresPerSquareSecond = UnitForQuantity(
      ProductUnit._([
        RationalPower<Unit>(metre),
        RationalPower<Unit>(second, RationalNumber._(-2))
      ]),
      Quantities.acceleration);

  /// Equivalent to [metresPerSquareSecond] (American spelling).
  static const Unit metersPerSquareSecond = metresPerSquareSecond;

  /// The metric unit for area quantities (`m²`).
  static const Unit squareMetre = UnitForQuantity(
      ProductUnit._([RationalPower<Unit>(metre, RationalNumber._(2))]),
      Quantities.area);

  /// The metric unit for volume quantities (`m³`).
  static const Unit cubicMetre = UnitForQuantity(
      ProductUnit._([RationalPower<Unit>(metre, RationalNumber._(3))]),
      Quantities.volume);

  /// Equivalent to `KILO(METRE)`.
  static const Unit kilometre = TransformedUnit(metre, E3);

  /// Equivalent to [kilometre] (American spelling).
  static const Unit kilometer = kilometre;

  /// Equivalent to `CENTI(METRE)`.
  static const Unit centimetre = TransformedUnit(metre, Em2);

  /// Equivalent to [centimetre] (American spelling).
  static const Unit centimeter = centimetre;

  /// Equivalent to `MILLI(METRE)`.
  static const Unit millimetre = TransformedUnit(metre, Em3);

  /// Equivalent to [millimetre] (American spelling).
  static const Unit millimeter = millimetre;

  /////////////////
  // SI PREFIXES //
  /////////////////

  /// Returns the specified unit multiplied by the factor `10<sup>24</sup>`
  static Unit yotta(Unit unit) => unit.transform(E24);

  /// Returns the specified unit multiplied by the factor `10<sup>21</sup>`
  static Unit zetta(Unit unit) => unit.transform(E21);

  /// Returns the specified unit multiplied by the factor `10<sup>18</sup>`
  static Unit exa(Unit unit) => unit.transform(E18);

  /// Returns the specified unit multiplied by the factor `10<sup>15</sup>`
  static Unit peta(Unit unit) => unit.transform(E15);

  /// Returns the specified unit multiplied by the factor `10<sup>12</sup>`
  static Unit tera(Unit unit) => unit.transform(E12);

  /// Returns the specified unit multiplied by the factor `10<sup>9</sup>`
  static Unit giga(Unit unit) => unit.transform(E9);

  /// Returns the specified unit multiplied by the factor `10<sup>6</sup>`
  static Unit mega(Unit unit) => unit.transform(E6);

  /// Returns the specified unit multiplied by the factor `10<sup>3</sup>`
  static Unit kilo(Unit unit) => unit.transform(E3);

  /// Returns the specified unit multiplied by the factor `10<sup>2</sup>`
  static Unit hecto(Unit unit) => unit.transform(E2);

  /// Returns the specified unit multiplied by the factor `10<sup>1</sup>`
  static Unit deka(Unit unit) => unit.transform(E1);

  /// Returns the specified unit multiplied by the factor `10<sup>-1</sup>`
  static Unit deci(Unit unit) => unit.transform(Em1);

  /// Returns the specified unit multiplied by the factor `10<sup>-2</sup>`
  static Unit centi(Unit unit) => unit.transform(Em2);

  /// Returns the specified unit multiplied by the factor `10<sup>-3</sup>`
  static Unit milli(Unit unit) => unit.transform(Em3);

  /// Returns the specified unit multiplied by the factor `10<sup>-6</sup>`
  static Unit micro(Unit unit) => unit.transform(Em6);

  /// Returns the specified unit multiplied by the factor `10<sup>-9</sup>`
  static Unit nano(Unit unit) => unit.transform(Em9);

  /// Returns the specified unit multiplied by the factor `10<sup>-12</sup>`
  static Unit pico(Unit unit) => unit.transform(Em12);

  /// Returns the specified unit multiplied by the factor `10<sup>-15</sup>`
  static Unit femto(Unit unit) => unit.transform(Em15);

  /// Returns the specified unit multiplied by the factor `10<sup>-18</sup>`
  static Unit atto(Unit unit) => unit.transform(Em18);

  /// Returns the specified unit multiplied by the factor `10<sup>-21</sup>`
  static Unit zepto(Unit unit) => unit.transform(Em21);

  /// Returns the specified unit multiplied by the factor `10<sup>-24</sup>`
  static Unit yocto(Unit unit) => unit.transform(Em24);

  // Holds prefix converters (optimization).

  static const MultiplyConverter E24 = MultiplyConverter._(1E24);

  static const MultiplyConverter E21 = MultiplyConverter._(1E21);

  static const RationalConverter E18 =
      RationalConverter._(RationalNumber._(1000000000000000000));

  static const RationalConverter E15 =
      RationalConverter._(RationalNumber._(1000000000000000));

  static const RationalConverter E12 =
      RationalConverter._(RationalNumber._(1000000000000));

  static const RationalConverter E9 =
      RationalConverter._(RationalNumber._(1000000000));

  static const RationalConverter E6 =
      RationalConverter._(RationalNumber._(1000000));

  static const RationalConverter E3 =
      RationalConverter._(RationalNumber._(1000));

  static const RationalConverter E2 =
      RationalConverter._(RationalNumber._(100));

  static const RationalConverter E1 = RationalConverter._(RationalNumber._(10));

  static const RationalConverter Em1 =
      RationalConverter._(RationalNumber._(1, 10));

  static const RationalConverter Em2 =
      RationalConverter._(RationalNumber._(1, 100));

  static const RationalConverter Em3 =
      RationalConverter._(RationalNumber._(1, 1000));

  static const RationalConverter Em6 =
      RationalConverter._(RationalNumber._(1, 1000000));

  static const RationalConverter Em9 =
      RationalConverter._(RationalNumber._(1, 1000000000));

  static const RationalConverter Em12 =
      RationalConverter._(RationalNumber._(1, 1000000000000));

  static const RationalConverter Em15 =
      RationalConverter._(RationalNumber._(1, 1000000000000000));

  static const RationalConverter Em18 =
      RationalConverter._(RationalNumber._(1, 1000000000000000000));

  static const MultiplyConverter Em21 = MultiplyConverter._(1E-21);

  static const MultiplyConverter Em24 = MultiplyConverter._(1E-24);
}

/// Contains units that are not part of the International System of Units, that
/// is, they are outside the SI, but are important and widely used.
abstract class NonSI extends SystemOfUnits {
  static const Map<String, Unit> unitsBySymbol = {};

  /// The standard gravity constant: 9.80665 m/s² exact.
  static const standardGravity = RationalNumber._(980665, 100000);

  /// The international foot: 0.3048 m exact.
  static const internationalFoot = RationalNumber._(3048, 10000);

  /// The avoirdupois pound: 0.45359237 kg exact
  static const avoirdupoisPound = RationalNumber._(45359237, 100000000);

  /// The Avogadro constant.
  static const double avogadroConstant = 6.02214199e23; // (1/mol).

  /// The electric charge of one electron.
  static const double elementaryCharge = 1.602176462e-19; // (C).

  const NonSI._();

  ///////////////////
  // Dimensionless //
  ///////////////////

  /// A dimensionless unit equals to `0.01` (standard name `%`).
  static const Unit percent = TransformedUnit(Unit.one, SI.Em2);

  /// A logarithmic unit used to describe a ratio (standard name `dB`).
  static const Unit decibel = TransformedUnit(
      Unit.one,
      _CompoundConverter(RationalConverter._(RationalNumber._(1, 10)),
          _InverseLogConverter(LogConverter._(10.0))));

  /////////////////////////
  // Amount of substance //
  /////////////////////////

  /// A unit of amount of substance equals to one atom (standard name `atom`).
  static const Unit atom =
      TransformedUnit(SI.mole, MultiplyConverter._(1 / avogadroConstant));

  ////////////
  // Length //
  ////////////

  /// A unit of length equal to `0.3048 m` (standard name `ft`).
  static const Unit foot =
      TransformedUnit(SI.metre, RationalConverter._(internationalFoot));

  /// A unit of length equal to `1200/3937 m` (standard name `foot_survey_us`).
  static const Unit footSurveyUS = TransformedUnit(
      SI.metre, RationalConverter._(RationalNumber._(1200, 3937)));

  /// A unit of length equal to `0.9144 m` (standard name `yd`).
  static const Unit yard =
      TransformedUnit(foot, RationalConverter._(RationalNumber._(3)));

  /// A unit of length equal to `0.0254 m` (standard name `in`).
  static const Unit inch =
      TransformedUnit(foot, RationalConverter._(RationalNumber._(1, 12)));

  /// A unit of length equal to `1609.344 m` (standard name `mi`).
  static const Unit mile = TransformedUnit(
      SI.metre, RationalConverter._(RationalNumber._(1609344, 1000)));

  /// A unit of length equal to `1852.0 m` (standard name `nmi`).
  static const Unit nauticalMile =
      TransformedUnit(SI.metre, RationalConverter._(RationalNumber._(1852)));

  /// A unit of length equal to `1E-10 m` (standard name `Å`).
  static const Unit angstrom = TransformedUnit(
      SI.metre, RationalConverter._(RationalNumber._(1, 10000000000)));

  /// A unit of length equal to the average distance from the center of the
  /// Earth to the center of the Sun (standard name `ua`).
  static const Unit astronomicalUnit = TransformedUnit(
      SI.metre, RationalConverter._(RationalNumber._(149597870691, 1)));

  /// A unit of length equal to the distance that light travels in one year
  /// through a vacuum (standard name `ly`).
  static const Unit lightYear =
      TransformedUnit(SI.metre, MultiplyConverter._(9.460528405e15));

  /// A unit of length equal to the distance at which a star would appear to
  /// shift its position by one arcsecond over the course the time
  /// (about 3 months) in which the Earth moves a distance of
  /// [astronomicalUnit] in the direction perpendicular to the
  /// direction to the star (standard name `pc`).
  static const Unit parsec =
      TransformedUnit(SI.metre, MultiplyConverter._(30856770e9));

  /// A unit of length equal to `0.013837 [INCH]` exactly (standard name `pt`).
  static const Unit point = TransformedUnit(
      NonSI.inch, RationalConverter._(RationalNumber._(13837, 1000000)));

  /// A unit of length equal to `1/72 [INCH]` (standard name `pixel`).
  ///
  /// It is the American point rounded to an even 1/72 inch.
  static const Unit pixel =
      TransformedUnit(NonSI.inch, RationalConverter._(RationalNumber._(1, 72)));

  /// Equivalent [pixel]
  static const Unit computerPoint = pixel;

  //////////////
  // Duration //
  //////////////

  /// A unit of duration equal to `60 s` (standard name `min`).
  static const Unit minute =
      TransformedUnit(SI.second, RationalConverter._(RationalNumber._(60)));

  /// A unit of duration equal to `60 [MINUTE]` (standard name `h`).
  static const Unit hour = TransformedUnit(
      SI.second, RationalConverter._(RationalNumber._(60 * 60)));

  /// A unit of duration equal to `24 [HOUR]` (standard name `d`).
  static const Unit day = TransformedUnit(
      SI.second, RationalConverter._(RationalNumber._(60 * 60 * 24)));

  /// A unit of duration equal to `7 [DAY]` (standard name `week`).
  static const Unit week = TransformedUnit(
      SI.second, RationalConverter._(RationalNumber._(60 * 60 * 24 * 7)));

  /// A unit of duration equal to 365 days, 5 hours, 49 minutes,
  /// and 12 seconds (standard name `year`).
  static const Unit year = TransformedUnit(
      SI.second, RationalConverter._(RationalNumber._(31556952)));

  /// A unit of duration equal to one twelfth of a year (standard name `month`).
  static const Unit month = TransformedUnit(
      SI.second, RationalConverter._(RationalNumber._(31556952, 12)));

  /// A unit of duration equal to the time required for a complete rotation of
  /// the earth in reference to any star or to the vernal equinox at the
  /// meridian, equal to 23 hours, 56 minutes, 4.09 seconds
  /// (standard name `day_sidereal`).
  static const Unit daySidereal =
      TransformedUnit(SI.second, MultiplyConverter._(86164.09));

  /// A unit of duration equal to one complete revolution of the
  /// earth about the sun, relative to the fixed stars, or 365 days, 6 hours,
  /// 9 minutes, 9.54 seconds (standard name `year_sidereal`).
  static const Unit yearSidereal =
      TransformedUnit(SI.second, MultiplyConverter._(31558149.54));

  /// A unit of duration equal to `365 [DAY]` (standard name `year_calendar`).
  static const Unit yearCalendar = TransformedUnit(
      SI.second, RationalConverter._(RationalNumber._(60 * 60 * 24 * 365)));

  //////////
  // Mass //
  //////////

  /// A unit of mass equal to 1/12 the mass of the carbon-12 atom
  /// (standard name `u`).
  static const Unit atomicMass = TransformedUnit(
      SI.kilogram, MultiplyConverter._(1e-3 / avogadroConstant));

  /// A unit of mass equal to the mass of the electron (standard name `me`).
  static const Unit electronMass =
      TransformedUnit(SI.kilogram, MultiplyConverter._(9.10938188e-31));

  /// A unit of mass equal to `453.59237 grams` (avoirdupois pound,
  /// standard name `lb`).
  static const Unit pound =
      TransformedUnit(SI.kilogram, RationalConverter._(avoirdupoisPound));

  /// A unit of mass equal to `1 / 16 [POUND]` (standard name `oz`).
  static const Unit ounce = TransformedUnit(
      NonSI.pound, RationalConverter._(RationalNumber._(1, 16)));

  /// A unit of mass equal to `2000 [POUND]` (short ton, standard name `ton_us`).
  static const Unit tonUS =
      TransformedUnit(NonSI.pound, RationalConverter._(RationalNumber._(2000)));

  /// A unit of mass equal to `2240 [POUND]` (long ton, standard name `ton_uk`).
  static const Unit tonUK =
      TransformedUnit(NonSI.pound, RationalConverter._(RationalNumber._(2240)));

  /// A unit of mass equal to `1000 kg` (metric ton, standard name `t`).
  static const Unit metricTon = TransformedUnit(SI.kilogram, SI.E3);

  /////////////////////
  // Electric charge //
  /////////////////////

  /// A unit of electric charge equal to the charge on one electron
  /// (standard name `e`).
  static const Unit e =
      TransformedUnit(SI.coulomb, MultiplyConverter._(elementaryCharge));

  /// A unit of electric charge equal to equal to the product of Avogadro's
  /// number (see [mole]) and the charge (1 e) on a single electron
  /// (standard name `Fd`).
  static const Unit faraday = TransformedUnit(
      SI.coulomb, MultiplyConverter._(elementaryCharge * avogadroConstant));

  /// A unit of electric charge which exerts a force of one dyne on an equal
  /// charge at a distance of one centimeter (standard name `Fr`).
  static const Unit franklin =
      TransformedUnit(SI.coulomb, MultiplyConverter._(3.3356e-10));

  /////////////////
  // Temperature //
  /////////////////

  /// A unit of temperature equal to `5/9 °K` (standard name `°R`).
  static const Unit rankine =
      TransformedUnit(SI.kelvin, RationalConverter._(RationalNumber._(5, 9)));

  /// A unit of temperature equal to degree Rankine minus `459.67 °R`
  /// (standard name `°F`).
  static const Unit fahrenheit =
      TransformedUnit(rankine, AddConverter._(459.67));

  ///////////
  // Angle //
  ///////////

  /// A unit of angle equal to a full circle or `2<i>&pi;</i> [SI.RADIAN]`
  /// (standard name `rev`).
  static const Unit revolution =
      TransformedUnit(SI.radian, MultiplyConverter._(2.0 * math.pi));

  /// A unit of angle equal to `1/360 [REVOLUTION]` (standard name `°`).
  static const Unit degreeAngle =
      TransformedUnit(SI.radian, MultiplyConverter._(math.pi / 180));

  /// A unit of angle equal to `1/60 [DEGREE_ANGLE]` (standard name `′`).
  static const Unit minuteAngle =
      TransformedUnit(SI.radian, MultiplyConverter._(math.pi / 180 / 60));

  /// A unit of angle equal to `1/60 [MINUTE_ANGLE]` (standard name `'`).
  static const Unit secondAngle =
      TransformedUnit(SI.radian, MultiplyConverter._(math.pi / 180 / 60 / 60));

  /// A unit of angle equal to `0.01 [SI.RADIAN]` (standard name `centiradian`).
  static const Unit centiradian = TransformedUnit(SI.radian, SI.Em2);

  /// A unit of angle measure equal to `1/400 [REVOLUTION]`
  /// (standard name `grade`).
  static const Unit grade = TransformedUnit(
      NonSI.revolution, RationalConverter._(RationalNumber._(1, 400)));

  //////////////
  // Velocity //
  //////////////

  /// A unit of velocity expressing the number of international
  /// [mile] per [hour] (abbreviation `mph`).
  static const Unit milesPerHour = ProductUnit._([
    RationalPower<Unit>(NonSI.mile),
    RationalPower<Unit>(NonSI.hour, RationalNumber._(-1))
  ]);

  /// A unit of velocity expressing the number of [SI.kilometre] per [hour].
  static const Unit kilometresPerHour = ProductUnit._([
    RationalPower<Unit>(SI.kilometer),
    RationalPower<Unit>(NonSI.hour, RationalNumber._(-1))
  ]);

  /// Equivalent to [kilometresPerHour].
  static const Unit kilometersPerHour = kilometresPerHour;

  /// A unit of velocity expressing the number of [nauticalMile] per [hour]
  /// (abbreviation `kn`).
  static const Unit knot = ProductUnit._([
    RationalPower<Unit>(NonSI.nauticalMile),
    RationalPower<Unit>(NonSI.hour, RationalNumber._(-1))
  ]);

  /// A unit of velocity to express the speed of an aircraft relative to
  /// the speed of sound (standard name `Mach`).
  static const Unit mach =
      TransformedUnit(SI.metersPerSecond, MultiplyConverter._(331.6));

  /// A unit of velocity relative to the speed of light
  /// (standard name `c`).
  static const Unit c = TransformedUnit(
      SI.metersPerSecond, RationalConverter._(RationalNumber._(299792458, 1)));

  //////////////////
  // Acceleration //
  //////////////////

  /// A unit of acceleration equal to the gravity at the earth's surface
  /// (standard name `grav`).
  static const Unit g = TransformedUnit(
      SI.metresPerSquareSecond, RationalConverter._(standardGravity));

  //////////
  // Area //
  //////////

  /// A unit of area equal to `100 m²`
  /// (standard name `a`).
  static const Unit are = TransformedUnit(SI.squareMetre, SI.E2);

  /// A unit of area equal to `100 [ARE]`
  /// (standard name `ha`).
  static const Unit hectare = TransformedUnit(NonSI.are, SI.E2);

  /////////////////
  // Data Amount //
  /////////////////

  /// A unit of data amount equal to `8 [SI.BIT]`
  /// (BinarY TErm, standard name `byte`).
  static const Unit byte =
      TransformedUnit(SI.bit, RationalConverter._(RationalNumber._(8)));

  /// Equivalent [byte]
  static const Unit octet = byte;

  //////////////////////
  // Electric current //
  //////////////////////

  /// A unit of electric charge equal to the centimeter-gram-second
  /// electromagnetic unit of magnetomotive force, equal to `10/4
  /// &pi;ampere-turn` (standard name `Gi`).
  static const Unit gilbert =
      TransformedUnit(SI.ampere, MultiplyConverter._(10.0 / (4.0 * math.pi)));

  ////////////
  // Energy //
  ////////////

  /// A unit of energy equal to `1E-7 J`
  /// (standard name `erg`).
  static const Unit erg = TransformedUnit(
      SI.joule, RationalConverter._(RationalNumber._(1, 10000000)));

  /// A unit of energy equal to one electron-volt (standard name
  /// `eV`, also recognized `keV, MeV, GeV`).
  static const Unit electronVolt =
      TransformedUnit(SI.joule, MultiplyConverter._(elementaryCharge));

  /////////////////
  // Illuminance //
  /////////////////

  /// A unit of illuminance equal to `1E4 Lx`
  /// (standard name `La`).
  static const Unit lambert =
      TransformedUnit(SI.lux, RationalConverter._(RationalNumber._(10000)));

  ///////////////////
  // Magnetic Flux //
  ///////////////////

  /// A unit of magnetic flux equal `1E-8 Wb`
  /// (standard name `Mx`).
  static const Unit maxwell = TransformedUnit(
      SI.weber, RationalConverter._(RationalNumber._(1, 100000000)));

  ///////////////////////////
  // Magnetic Flux Density //
  ///////////////////////////

  /// A unit of magnetic flux density equal `1000 A/m`
  /// (standard name `G`).
  static const Unit gauss = TransformedUnit(
      SI.tesla, RationalConverter._(RationalNumber._(1, 10000)));

  ///////////
  // Force //
  ///////////

  /// A unit of force equal to `1E-5 N`
  /// (standard name `dyn`).
  static const Unit dyne = TransformedUnit(
      SI.newton, RationalConverter._(RationalNumber._(1, 100000)));

  /// A unit of force equal to `9.80665 N`
  /// (standard name `kgf`).
  static const Unit kilogramForce =
      TransformedUnit(SI.newton, RationalConverter._(standardGravity));

  /// A unit of force equal to `[POUND]·[G]`
  /// (standard name `lbf`).
  static const Unit poundForce = TransformedUnit(
      SI.newton,
      RationalConverter._(
          RationalNumber._(45359237 * 980665, 100000000 * 100000)));

  ///////////
  // Power //
  ///////////

  /// A unit of power equal to the power required to raise a mass of 75
  /// kilograms at a velocity of 1 meter per second (metric,
  /// standard name `hp`).
  static const Unit horsepower =
      TransformedUnit(SI.watt, MultiplyConverter._(735.499));

  //////////////
  // Pressure //
  //////////////

  /// A unit of pressure equal to the average pressure of the Earth's
  /// atmosphere at sea level (standard name `atm`).
  static const Unit atmosphere = TransformedUnit(
      SI.pascal, RationalConverter._(RationalNumber._(1, 101325)));

  /// A unit of pressure equal to `100 kPa`
  /// (standard name `bar`).
  static const Unit bar = TransformedUnit(
      SI.pascal, RationalConverter._(RationalNumber._(1, 100000)));

  /// A unit of pressure equal to the pressure exerted at the Earth's
  /// surface by a column of mercury 1 millimeter high
  /// (standard name `mmHg`).
  static const Unit millimeterOfMercury =
      TransformedUnit(SI.pascal, MultiplyConverter._(133.322));

  /// A unit of pressure equal to the pressure exerted at the Earth's
  /// surface by a column of mercury 1 inch high
  /// (standard name `inHg`).
  static const Unit inchOfMercury =
      TransformedUnit(SI.pascal, MultiplyConverter._(3386.388));

  /////////////////////////////
  // Radiation dose absorbed //
  /////////////////////////////

  /// A unit of radiation dose absorbed equal to a dose of 0.01 joule of
  /// energy per kilogram of mass (J/kg) (standard name `rd`).
  static const Unit rad = TransformedUnit(SI.gray, SI.Em2);

  /// A unit of radiation dose effective equal to `0.01 Sv`
  /// (standard name `rem`).
  static const Unit rem = TransformedUnit(SI.sievert, SI.Em2);

  //////////////////////////
  // Radioactive activity //
  //////////////////////////

  /// A unit of radioctive activity equal to the activity of a gram of radium
  /// (standard name `Ci`).
  static const Unit curie = TransformedUnit(
      SI.becquerel, RationalConverter._(RationalNumber._(37000000000)));

  /// A unit of radioctive activity equal to 1 million radioactive
  /// disintegrations per second (standard name `Rd`).
  static const Unit rutherford = TransformedUnit(SI.becquerel, SI.E6);

  /////////////////
  // Solid angle //
  /////////////////

  /// A unit of solid angle equal to `4 <i>&pi;</i> steradians`
  /// (standard name `sphere`).
  static const Unit sphere =
      TransformedUnit(SI.steradian, MultiplyConverter._(4.0 * math.pi));

  ////////////
  // Volume //
  ////////////

  /// A unit of volume equal to one cubic decimeter (default label
  /// `L`, also recognized `µL, mL, cL, dL`).
  static const Unit litre = TransformedUnit(SI.cubicMetre, SI.Em3);

  /// Equivalent to [litre] (American spelling).
  static const Unit liter = litre;

  /// A unit of volume equal to one cubic inch (`in³`).
  static const Unit cubicInch =
      ProductUnit._([RationalPower(inch, RationalNumber._(3))]);

  /// A unit of volume equal to one US gallon, Liquid Unit. The U.S. liquid
  /// gallon is based on the Queen Anne or Wine gallon occupying 231 cubic
  /// inches (standard name `gal`).
  static const Unit gallonLiquidUS =
      TransformedUnit(cubicInch, RationalConverter._(RationalNumber._(231, 1)));

  /// A unit of volume equal to `1 / 128 [GALLON_LIQUID_US]`
  /// (standard name `oz_fl`).
  static const Unit ounceLiquidUS = TransformedUnit(
      gallonLiquidUS, RationalConverter._(RationalNumber._(1, 128)));

  /// A unit of volume equal to one US dry gallon.
  /// (standard name `gallon_dry_us`).
  static const Unit gallonDryUS = TransformedUnit(
      cubicInch, RationalConverter._(RationalNumber._(2688025, 10000)));

  /// A unit of volume equal to `4.546 09 [LITRE]`
  /// (standard name `gal_uk`).
  static const Unit gallonUK = TransformedUnit(
      litre, RationalConverter._(RationalNumber._(454609, 100000)));

  /// A unit of volume equal to `1 / 160 [GALLON_UK]`
  /// (standard name `oz_fl_uk`).
  static const Unit ounceLiquidUK =
      TransformedUnit(gallonUK, RationalConverter._(RationalNumber._(1, 160)));

  ///////////////
  // Viscosity //
  ///////////////

  /// A unit of dynamic viscosity equal to `1 g/(cm·s)` (cgs unit).
  static const Unit poise = ProductUnit._([
    RationalPower<Unit>(SI.gram),
    RationalPower<Unit>(SI.centimeter, RationalNumber._(-1)),
    RationalPower<Unit>(SI.second, RationalNumber._(-1))
  ]);

  /// A unit of kinematic viscosity equal to `1 cm²/s` (cgs unit).
  static const Unit stoke = ProductUnit._([
    RationalPower<Unit>(SI.centimeter, RationalNumber._(2)),
    RationalPower<Unit>(SI.second, RationalNumber._(-1))
  ]);

  ////////////
  // Others //
  ////////////

  /// A unit used to measure the ionizing ability of radiation
  /// (standard name `Roentgen`).
  static const Unit roentgen = TransformedUnit(
      ProductUnit._([
        RationalPower<Unit>(SI.coulomb),
        RationalPower<Unit>(SI.kilogram, RationalNumber._(-1))
      ]),
      MultiplyConverter._(2.58e-4));
}

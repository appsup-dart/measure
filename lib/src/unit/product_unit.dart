part of '../unit.dart';

/// Units formed by the product of rational powers of existing units.
class ProductUnit extends DerivedUnit {
  final List<RationalPower<Unit>> _elements;

  const ProductUnit._(this._elements) : super();

  factory ProductUnit(Iterable<RationalPower<Unit>> elements) {
    var all = elements
        .expand((v) {
          var base = v.base;
          if (base is AlternateUnit) return [v];
          if (base is UnitForQuantity) {
            base = base.parent;
          }
          if (base is ProductUnit) {
            // TODO recursive
            return base._elements
                .map((s) => RationalPower(s.base, s.pow.times(v.pow)));
          }
          return [v];
        })
        .where((v) => v.base != Unit.one)
        .toList();

    var map = <Unit, RationalPower<Unit>>{};
    for (var e in all) {
      if (map.containsKey(e.base)) {
        map[e.base] = RationalPower(e.base, map[e.base]!.pow.add(e.pow));
      } else {
        map[e.base] = e;
      }
    }
    return ProductUnit._(map.values.toList());
  }

  Unit simplify() {
    var elements =
        _elements.where((e) => e.pow.dividend != 0 || e.pow.divisor == 0);

    if (elements.length == 1) {
      if (elements.first.pow == RationalNumber(1, 1)) {
        return elements.first.base;
      }
    }
    return ProductUnit._(elements.toList());
  }

  Unit _simplifyDeep() {
    var u = simplify();
    if (u is! ProductUnit) return u;
    for (var i = 0; i < u._elements.length; i++) {
      var e = u._elements[i];
      var b = e.base;
      if (b is UnitForQuantity) {
        b = b.parent;
      }
      if (b is ProductUnit) {
        var v = ProductUnit([
          ...u._elements.sublist(0, i),
          ...b._elements.map((s) => RationalPower(s.base, s.pow.times(e.pow))),
          ...u._elements.sublist(i + 1),
        ])._simplifyDeep();
        if (v is! ProductUnit) return v;
      }
    }
    return u;
  }

  @override
  Unit get standardUnit {
    if (_hasOnlyStandardUnit()) return this;

    return _elements
        .map((v) => v.base.standardUnit.pow(v.pow))
        .fold(Unit.one, (a, b) => a.times(b));
  }

  @override
  UnitConverter toStandardUnit() {
    if (_hasOnlyStandardUnit()) return UnitConverter.identity;

    return _elements.expand((v) {
      var cvtr = v.base.toStandardUnit();
      if (!cvtr.isLinear) {
        throw StateError('${v.base} is non-linear, cannot convert');
      }
      if (v.pow.divisor != 1) {
        throw StateError(
            '${v.base} holds a base unit with fractional exponent');
      }
      if (v.pow.dividend < 0) cvtr = cvtr.inverse;
      return List.generate(v.pow.dividend.abs(), (_) => cvtr);
    }).fold(UnitConverter.identity, (UnitConverter a, b) => a.concatenate(b));
  }

  bool _hasOnlyStandardUnit() => _elements.every((v) => v.base.isStandardUnit);

  /// The units composing this product unit.
  List<RationalPower<Unit>> get elements => List.unmodifiable(_elements);

  @override
  int get hashCode => DeepCollectionEquality.unordered().hash(_elements);

  @override
  bool operator ==(other) =>
      other is ProductUnit &&
      const DeepCollectionEquality.unordered()
          .equals(other._elements, _elements);

  @override
  Quantity get quantity {
    var unit = standardUnit;
    if (unit is ProductUnit) unit = unit._simplifyDeep();
    if (unit == this) {
      if (_elements.isEmpty) return Quantities.dimensionless;

      // Find the quantity that has this unit as definition
      var q = Quantities.values.where(
        (q) =>
            (q.siUnit is UnitForQuantity
                ? (q.siUnit as UnitForQuantity).parent
                : q.siUnit) ==
            unit,
      );
      if (q.length == 1) return q.first;

      // Find the quantity that has the same base unit
      var b = baseUnit;
      q = Quantities.values.where((q) => q.siUnit.baseUnit == b);
      if (q.isEmpty) throw StateError('No quantity found for $b');
      if (q.length > 1) {
        throw StateError('Multiple quantities found for $b: $q');
      }
      return q.first;
    }
    return unit.quantity;
  }

  @override
  Unit get baseUnit {
    return _elements
        .map((v) => v.base.baseUnit.pow(v.pow))
        .fold(Unit.one, (a, b) => a.times(b));
  }
}

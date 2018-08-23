part of measure;

/// Units formed by the product of rational powers of existing units.
class ProductUnit<Q extends Quantity> extends DerivedUnit<Q> {

    final List<RationalPower<Unit>> _elements;


    const ProductUnit._(this._elements) : super();


    factory ProductUnit(Iterable<RationalPower<Unit>> elements) {
        var all = elements.expand((v) {
            var base = v.base;
            if (base is ProductUnit) { // TODO recursive
                return base._elements.map((s)=>new RationalPower(s.base, s.pow.times(v.pow)));
            }
            return [v];
        })
        .where((v)=>v!=Unit.one)
        .toList(); // TODO group elements with same base
        return new ProductUnit._(all);
    }

    Unit<Q> simplify() {
      if (_elements.length==1) {
        if (_elements.first.pow==new RationalNumber(1, 1)) {
          return _elements.first.base;
        }
      }
      return this;
    }

    @override
    Unit get standardUnit {
      if (_hasOnlyStandardUnit())
        return this;

      return _elements
          .map((v) => v.base.standardUnit.pow(v.pow))
          .fold(Unit.one, (a,b)=>a.times(b));
    }

    @override
    UnitConverter toStandardUnit() {
      if (_hasOnlyStandardUnit())
        return UnitConverter.identity;

      return _elements
          .expand((v) {
        var cvtr = v.base.toStandardUnit();
        if (!cvtr.isLinear)
          throw new StateError("${v.base} is non-linear, cannot convert");
        if (v.pow.divisor != 1)
          throw new StateError("${v.base} holds a base unit with fractional exponent");
        if (v.pow.dividend<0) cvtr = cvtr.inverse;
        return new List.generate(v.pow.dividend.abs(), (_)=>cvtr);
      })
          .fold(UnitConverter.identity, (UnitConverter a,b)=>a.concatenate(b));
    }

    bool _hasOnlyStandardUnit() => _elements.every((v)=>v.base.isStandardUnit);

    /// The units composing this product unit.
    List<RationalPower<Unit>> get elements => new List.unmodifiable(_elements);

    @override
    Unit<R> cast<R extends Quantity>() => new ProductUnit._(_elements);

    @override
    int get hashCode => quiver.hashObjects(_elements);

    @override
    bool operator==(other) => other is ProductUnit<Q>&&
        const ListEquality().equals(other._elements, _elements);
}



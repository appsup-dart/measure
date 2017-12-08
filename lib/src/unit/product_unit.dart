part of measure;

/// Units formed by the product of rational powers of existing units.
class ProductUnit<Q extends Quantity> extends DerivedUnit<Q> {

    /// The units composing this product unit.
    final List<_RationalPower<Unit>> _elements;


    const ProductUnit._(this._elements) : super();


    factory ProductUnit(Iterable<_RationalPower<Unit>> elements) {
        var all = elements.expand((v) {
            var base = v.base;
            if (base is ProductUnit) {
                return base._elements.map((s)=>new _RationalPower(s.base, s.pow.times(v.pow)));
            }
            return [v];
        })
        .where((v)=>v!=Unit.one); // TODO group elements with same base
        return new ProductUnit._(all);
    }

    @override
    Unit get standardUnit => throw new UnimplementedError();

    @override
    UnitConverter toStandardUnit() => throw new UnimplementedError();

}



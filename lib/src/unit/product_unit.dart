part of measure;

/// Units formed by the product of rational powers of existing units.
class ProductUnit<Q extends Quantity> extends DerivedUnit<Q> {

    /// The units composing this product unit.
    final List<_RationalPower<Unit>> _elements;


    const ProductUnit._(this._elements) : super._();

    @override
    Unit get standardUnit => throw new UnimplementedError();

    @override
    UnitConverter toStandardUnit() => throw new UnimplementedError();

}



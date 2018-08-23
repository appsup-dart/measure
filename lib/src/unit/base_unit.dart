part of measure;

/// The building blocks on top of which all others units are created.
///
/// Base units are typically dimensionally independent.
/// The actual unit dimension is determinated by the current [DimensionalModel].
class BaseUnit<Q extends Quantity> extends Unit<Q> {

    /// The unique symbol for this base unit
    final String symbol;

    const BaseUnit(this.symbol) : super();

    @override
    BaseUnit<Q> get standardUnit => this;

    @override
    UnitConverter toStandardUnit() => UnitConverter.identity;

    @override
    Unit<R> cast<R extends Quantity>() => new BaseUnit(symbol);

    @override
    int get hashCode => symbol.hashCode;

    @override
    bool operator==(other) => other is BaseUnit<Q>&&other.symbol==symbol;

}
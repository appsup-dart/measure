part of measure;

/// The units used in expressions to distinguish between quantities of a
/// different nature but of the same dimensions.
class AlternateUnit<Q extends Quantity> extends DerivedUnit<Q> {

    /// The symbol for this alternate unit
    final String symbol;

    /// The parent unit from which this alternate unit is derived
    final Unit parent;

    const AlternateUnit(this.symbol, this.parent) : super();


    @override
    AlternateUnit<Q> get standardUnit => this;

    @override
    UnitConverter toStandardUnit() => UnitConverter.identity;

    @override
    Unit<R> cast<R extends Quantity>() => new AlternateUnit(symbol, parent);

    @override
    int get hashCode => quiver.hash2(symbol, parent);

    @override
    bool operator==(other) => other is AlternateUnit<Q>&&other.symbol==symbol&&other.parent==parent;
}
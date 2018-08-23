part of measure;

/// Units derived from other units using a [UnitConverter].
class TransformedUnit<Q extends Quantity> extends DerivedUnit<Q> {

    /// The parent unit for this unit.
    ///
    /// The parent unit is the  untransformed unit from which this unit is
    /// derived.
    final Unit<Q> parentUnit;

    /// The converter to the parent unit.
    final UnitConverter toParentUnit;

    const TransformedUnit(this.parentUnit, this.toParentUnit) : super();

    @override
    Unit get standardUnit => parentUnit.standardUnit;
    

    @override
    UnitConverter toStandardUnit() => parentUnit.toStandardUnit().concatenate(toParentUnit);

    @override
    int get hashCode => quiver.hash2(parentUnit,toParentUnit);

    @override
    bool operator==(other) => other is TransformedUnit<Q> && other.parentUnit==parentUnit && other.toParentUnit==toParentUnit;

    @override
    Unit<R> cast<R extends Quantity>() => new TransformedUnit(parentUnit.cast(), toParentUnit);

}
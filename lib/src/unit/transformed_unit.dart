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

}
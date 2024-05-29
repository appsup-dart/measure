part of measure.unit;

/// Units derived from other units using a [UnitConverter].
class TransformedUnit extends DerivedUnit {
  /// The parent unit for this unit.
  ///
  /// The parent unit is the  untransformed unit from which this unit is
  /// derived.
  final Unit parentUnit;

  /// The converter to the parent unit.
  final UnitConverter toParentUnit;

  const TransformedUnit(this.parentUnit, this.toParentUnit) : super();

  @override
  Unit get standardUnit => parentUnit.standardUnit;

  @override
  UnitConverter toStandardUnit() =>
      parentUnit.toStandardUnit().concatenate(toParentUnit);

  @override
  int get hashCode => quiver.hash2(parentUnit, toParentUnit);

  @override
  bool operator ==(other) =>
      other is TransformedUnit &&
      other.parentUnit == parentUnit &&
      other.toParentUnit == toParentUnit;

  @override
  Quantity get quantity => parentUnit.quantity;

  @override
  Unit get baseUnit => parentUnit.baseUnit;
}

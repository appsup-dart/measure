part of measure.unit;

/// The units used in expressions to distinguish between quantities of a
/// different nature but of the same dimensions.
class AlternateUnit extends DerivedUnit {
  /// The symbol for this alternate unit
  final String symbol;

  /// The parent unit from which this alternate unit is derived
  final Unit parent;

  @override
  final Quantity quantity;

  const AlternateUnit(this.symbol, this.parent, this.quantity) : super();

  @override
  AlternateUnit get standardUnit => this;

  @override
  UnitConverter toStandardUnit() => UnitConverter.identity;

  @override
  int get hashCode => quiver.hash2(symbol, parent);

  @override
  bool operator ==(other) =>
      other is AlternateUnit &&
      other.symbol == symbol &&
      other.parent == parent;

  @override
  Unit get baseUnit => parent.baseUnit;
}

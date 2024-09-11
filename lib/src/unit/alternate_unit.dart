part of '../unit.dart';

/// The units used in expressions to distinguish between quantities of a
/// different nature but of the same dimensions.
class AlternateUnit extends UnitForQuantity {
  /// The symbol for this alternate unit
  final String symbol;

  const AlternateUnit(this.symbol, super.parent, super.quantity);

  @override
  int get hashCode => Object.hash(AlternateUnit, symbol, parent, quantity);

  @override
  bool operator ==(other) =>
      other is AlternateUnit &&
      other.symbol == symbol &&
      other.parent == parent &&
      other.quantity == quantity;
}

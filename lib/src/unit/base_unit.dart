part of '../unit.dart';

/// The building blocks on top of which all others units are created.
///
/// Base units are typically dimensionally independent.
/// The actual unit dimension is determinated by the current [DimensionalModel].
class BaseUnit extends Unit {
  /// The unique symbol for this base unit
  final String symbol;

  @override
  final Quantity quantity;

  const BaseUnit(this.symbol, this.quantity) : super();

  @override
  BaseUnit get standardUnit => this;

  @override
  Unit get baseUnit => this;

  @override
  UnitConverter toStandardUnit() => UnitConverter.identity;

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(other) => other is BaseUnit && other.symbol == symbol;
}

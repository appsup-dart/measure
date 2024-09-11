part of '../unit.dart';

/// The units created by combining or transforming other units.
abstract class DerivedUnit extends Unit {
  const DerivedUnit() : super();
}

class UnitForQuantity extends DerivedUnit {
  /// The parent unit from which this unit is derived
  final Unit parent;

  @override
  final Quantity quantity;

  const UnitForQuantity(this.parent, this.quantity) : super();

  @override
  Unit get baseUnit => parent.baseUnit;

  @override
  Unit get standardUnit => this;

  @override
  UnitConverter toStandardUnit() => UnitConverter.identity;

  @override
  int get hashCode => Object.hash(UnitForQuantity, parent, quantity);

  @override
  bool operator ==(other) =>
      other is UnitForQuantity &&
      other.quantity == quantity &&
      other.parent == parent;
}

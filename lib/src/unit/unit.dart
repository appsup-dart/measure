part of measure.unit;

/// A determinate [Quantity] (as of length, time, heat, or value) adopted as a
/// standard of measurement.
///
/// It is helpful to think of instances of this class as recording the
/// history by which they are created. Thus, for example, the string
/// "g/kg" (which is a dimensionless unit) would result from invoking
/// the method toString() on a unit that was created by dividing a
/// gram unit by a kilogram unit. Yet, "kg" divided by "kg" returns
/// [one] and not "kg/kg" due to automatic unit factorization.
///
/// This class supports the multiplication of offsets units. The result is
/// usually a unit not convertible to its {@link #getStandardUnit standard unit}.
/// Such units may appear in derivative quantities. For example °C/m is an
/// unit of gradient, which is common in atmospheric and oceanographic
/// research.
///
/// Units raised at rational powers are also supported. For example
/// the cubic root of "liter" is a unit compatible with meter.
abstract class Unit {
  static const Unit one = ProductUnit._([]);

  const Unit();

  factory Unit.productOf(Unit a, Unit b) =>
      ProductUnit([RationalPower(a), RationalPower(b)]).simplify();
  factory Unit.quotient(Unit a, Unit b) => ProductUnit(
          [RationalPower(a), RationalPower(b, const RationalNumber._(-1))])
      .simplify();
  factory Unit.inverseOf(Unit a) =>
      ProductUnit([RationalPower(a, const RationalNumber._(-1))]).simplify();

  //////////////////////////////////////////////////////
  // Contract methods (for sub-classes to implement). //
  //////////////////////////////////////////////////////

  /// The [BaseUnit] base unit, [AlternateUnit] alternate unit or product of
  /// base units and alternate units this unit is derived from.
  ///
  /// The standard unit identifies the "type" of [Quantity] quantity for which
  /// this unit is employed.
  Unit get standardUnit;

  /// Returns the converter from this unit to its standard unit.
  UnitConverter toStandardUnit();

  /// Indicates if this unit is a standard unit.
  bool get isStandardUnit => standardUnit == this;

  /// Indicates if this unit is compatible with the unit specified.
  ///
  /// Units don't need to be equals to be compatible.
  bool isCompatible(Unit that) =>
      (this == that) ||
      standardUnit == that.standardUnit ||
      dimension == that.dimension;

  /// The dimension of this unit.
  ///
  /// Depends upon the current [DimensionalModel].
  Dimension get dimension => throw UnimplementedError();

  /// Returns a converter of numeric values from this unit to another unit.
  UnitConverter getConverterTo(Unit that) {
    if (this == that) return UnitConverter.identity;
    var thisSystemUnit = standardUnit;
    var thatSystemUnit = that.standardUnit;
    if (thisSystemUnit == thatSystemUnit) {
      return that.toStandardUnit().inverse.concatenate(toStandardUnit());
    }
    // Use dimensional transforms.
    throw UnimplementedError();
  }

  /// Returns the unit derived from this unit using the specified converter.
  Unit transform(UnitConverter operation) {
    if (this is TransformedUnit) {
      TransformedUnit tf = this;
      var parent = tf.parentUnit;
      var toParent = tf.toParentUnit.concatenate(operation);
      if (toParent == UnitConverter.identity) return parent;
      return TransformedUnit(parent, toParent);
    }
    if (operation == UnitConverter.identity) return this;
    return TransformedUnit(this, operation);
  }

  /// The result of adding an offset to this unit.
  Unit plus(num offset) => transform(AddConverter(offset));

  /// The quotient of this unit with the one specified.
  Unit divide(Unit that) => times(that.inverse());

  /// The inverse of this unit.
  Unit inverse() => Unit.inverseOf(this);

  /// The result of multiplying this unit by a factor.
  Unit scaled(num factor, [num divisor = 1]) =>
      transform(factor is int && divisor is int
          ? UnitConverter.rationalMultiply(factor, divisor)
          : UnitConverter.multiply(factor / divisor));

  /// The product of this unit with the one specified.
  Unit times(Unit that) => Unit.productOf(this, that);

  Unit pow(RationalNumber pow) => ProductUnit([RationalPower(this, pow)]);

  Quantity get quantity;

  @override
  String toString() => UnitFormat.asciiUnitFormat.format(this);
}

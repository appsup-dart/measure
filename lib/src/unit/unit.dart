part of measure;

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
abstract class Unit<Q extends Quantity> {

    static const Unit<Dimensionless> one = const ProductUnit<Dimensionless>._(const []);

    const Unit();

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
    bool get isStandardUnit => standardUnit==this;
    

    /// Indicates if this unit is compatible with the unit specified.
    ///
    /// Units don't need to be equals to be compatible.
    bool isCompatible(Unit that) => (this == that)
                || this.standardUnit==that.standardUnit
                || this.dimension==that.dimension;

  
    /// The dimension of this unit.
    ///
    /// Depends upon the current [DimensionalModel].
    Dimension get dimension => throw new UnimplementedError();

    /// Returns a converter of numeric values from this unit to another unit.
    UnitConverter getConverterTo(Unit that) {
        if (this==that)
            return UnitConverter.identity;
        Unit thisSystemUnit = this.standardUnit;
        Unit thatSystemUnit = that.standardUnit;
        if (thisSystemUnit==thatSystemUnit)
            return that.toStandardUnit().inverse.concatenate(
                    this.toStandardUnit());
        // Use dimensional transforms.
        throw new UnimplementedError();
    }


    /// Returns the unit derived from this unit using the specified converter.
    Unit<Q> transform(UnitConverter operation) {
        if (this is TransformedUnit) {
            TransformedUnit<Q> tf = this;
            Unit<Q> parent = tf.parentUnit;
            UnitConverter toParent = tf.toParentUnit.concatenate(operation);
            if (toParent == UnitConverter.identity)
                return parent;
            return new TransformedUnit<Q>(parent, toParent);
        }
        if (operation == UnitConverter.identity)
            return this;
        return new TransformedUnit<Q>(this, operation);
    }


}
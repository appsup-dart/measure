part of measure.unit;

/// The dimension of a unit.
abstract class Dimension {

    static DimensionalModel model = DimensionalModel.standard;

    /// Dimensionless
    static final Dimension none = const _BaseDimension("1");

    /// Length dimension (L)
    static final Dimension length = const _BaseDimension("L");

    /// Mass dimension (M)
    static final Dimension mass = new _BaseDimension('M');

    /// Time dimension (T)
    static final Dimension time = new _BaseDimension('T');

    /// Electric current dimension (I)
    static final Dimension electricCurrent = new _BaseDimension('I');

    /// Holds temperature dimension (θ)
    static final Dimension temperature = new _BaseDimension('θ');

    /// Amount of substance dimension (N).
    static final Dimension amountOfSubstance = new _BaseDimension('N');

}

class _BaseDimension implements Dimension {

    /// The unique symbol for this dimension
    final String symbol;


    const _BaseDimension(this.symbol);
    
    @override
    String toString() => "[$symbol]";


    @override
    int get hashCode => symbol.hashCode;

    @override
    bool operator==(other) => other is _BaseDimension&&other.symbol==symbol;

}

/// Represents the mapping between [BaseUnit] and [Dimension].DimensionalModel
abstract class DimensionalModel {

    /// The standard model (default).
    static DimensionalModel standard = new _StandardModel();

    /// Returns the dimension of the specified base unit (a dimension
    /// particular to the base unit if the base unit is not recognized).
    Dimension getDimension(BaseUnit unit);

    /// Returns the normalization transform of the specified base unit
    /// ([UnitConverter.identity] if the base unit is not recognized).
    UnitConverter getTransform(BaseUnit unit);
}

class _StandardModel extends DimensionalModel {
  Dimension getDimension(BaseUnit unit) {
      if (unit==(SI.metre)) return Dimension.length;
      if (unit==(SI.kilogram)) return Dimension.mass;
      if (unit==(SI.kelvin)) return Dimension.temperature;
      if (unit==(SI.second)) return Dimension.time;
      if (unit==(SI.ampere)) return Dimension.electricCurrent;
      if (unit==(SI.mole)) return Dimension.amountOfSubstance;
      if (unit==(SI.candela)) return SI.watt.dimension;
      return new _BaseDimension(unit.symbol);
  }
  
  UnitConverter getTransform(BaseUnit unit) {
      if (unit==(SI.candela)) return new RationalConverter._(new RationalNumber(1, 683));
      return UnitConverter.identity;
  }

}

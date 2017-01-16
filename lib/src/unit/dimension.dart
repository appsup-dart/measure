part of measure;

/// The dimension of a unit.
abstract class Dimension {

    static DimensionalModel model = DimensionalModel.STANDARD;

    /// Dimensionless
    static final Dimension NONE = const _BaseDimension("1");

    /// Length dimension (L)
    static final Dimension LENGTH = const _BaseDimension("L");

    /// Mass dimension (M)
    static final Dimension MASS = new _BaseDimension('M');

    /// Time dimension (T)
    static final Dimension TIME = new _BaseDimension('T');

    /// Electric current dimension (I)
    static final Dimension ELECTRIC_CURRENT = new _BaseDimension('I');

    /// Holds temperature dimension (θ)
    static final Dimension TEMPERATURE = new _BaseDimension('θ');

    /// Amount of substance dimension (N).
    static final Dimension AMOUNT_OF_SUBSTANCE = new _BaseDimension('N');

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
    static DimensionalModel STANDARD = new _StandardModel();

    /// Returns the dimension of the specified base unit (a dimension
    /// particular to the base unit if the base unit is not recognized).
    Dimension getDimension(BaseUnit unit);

    /// Returns the normalization transform of the specified base unit
    /// ([UnitConverter.IDENTITY] if the base unit is not recognized).
    UnitConverter getTransform(BaseUnit unit);
}

class _StandardModel extends DimensionalModel {
  Dimension getDimension(BaseUnit unit) {
      if (unit==(SI.METRE)) return Dimension.LENGTH;
      if (unit==(SI.KILOGRAM)) return Dimension.MASS;
      if (unit==(SI.KELVIN)) return Dimension.TEMPERATURE;
      if (unit==(SI.SECOND)) return Dimension.TIME;
      if (unit==(SI.AMPERE)) return Dimension.ELECTRIC_CURRENT;
      if (unit==(SI.MOLE)) return Dimension.AMOUNT_OF_SUBSTANCE;
      if (unit==(SI.CANDELA)) return SI.WATT.dimension;
      return new _BaseDimension(unit.symbol);
  }
  
  UnitConverter getTransform(BaseUnit unit) {
      if (unit==(SI.CANDELA)) return new RationalConverter._(new RationalNumber(1, 683));
      return UnitConverter.IDENTITY;
  }

}

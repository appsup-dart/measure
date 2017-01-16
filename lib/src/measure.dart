part of measure;

/// The measurable, countable, or comparable property or aspect of a thing.
abstract class Measurable<Q extends Quantity> extends Comparable<Measurable<Q>> {
    
    /// Returns the value of this measurable stated in the specified unit as a
    /// `double`.
    double doubleValue(Unit<Q> unit);

    /// Returns the estimated integral value of this measurable stated in the
    /// specified unit as an `integer`.
    int intValue(Unit<Q> unit);
    
}

/// The result of a measurement stated in a known unit.
abstract class Measure<V, Q extends Quantity> implements Measurable<Q> {

    const Measure._();

    /// The measurement value of this measure.
    V get value;

    /// The measurement unit of this measure.
    Unit<Q> get unit;

    /// Returns the measure equivalent to this measure but stated in the
    /// specified unit.
    Measure<V, Q> to(Unit<Q> unit);

    @override
    int intValue(Unit<Q> unit) => doubleValue(unit).round();

    @override
    int compareTo(Measurable<Q> that) =>
        doubleValue(unit).compareTo(that.doubleValue(unit));
    
}


/// Scalar measure.
class NumericMeasure<Q extends Quantity> extends Measure<num, Q> {

    final num value;

    final Unit<Q> unit;

    const NumericMeasure(this.value, this.unit) : super._();

    @override
    Measure<num, Q> to(Unit<Q> unit) {
        if (unit == this.unit)
            return this;
        return new NumericMeasure<Q>(doubleValue(unit), unit);
    }

    double doubleValue(Unit<Q> unit) {
        if (unit==this.unit)
            return value.toDouble();
        return this.unit.getConverterTo(unit).convert(value.toDouble());
    }

}



/// A measurement vector of two or more dimensions.
abstract class VectorMeasure<Q extends Quantity> extends Measure<List<double>, Q> {
    
    VectorMeasure._() : super._();
    
    /// Creates a 2-dimensional measurement vector.
    factory VectorMeasure.twoDimensional(double x, double y, Unit<Q> unit) = _TwoDimensional<Q>;

    /// Creates a 3-dimensional measurement vector.
    factory VectorMeasure.threeDimensional(double x, double y, double z, Unit<Q> unit) = _ThreeDimensional<Q>;

    /// Creates a multi-dimensional measurement vector.
    factory VectorMeasure.multiDimensional(List<double> components, Unit<Q> unit) = _MultiDimensional<Q>;

}

class _TwoDimensional<Q extends Quantity> extends VectorMeasure<Q> {
    
    final double x;
    
    final double y;
    
    final Unit<Q> unit;
    
    _TwoDimensional(this.x, this.y, this.unit) : super._();
    
    @override
    double doubleValue(Unit<Q> unit) {
        double norm = Math.sqrt(x * x + y * y); 
        if (unit==this.unit) return norm;
        return this.unit.getConverterTo(unit).convert(norm);            
    }

    @override
    List<double> get value => [x,y];

    @override
    _TwoDimensional<Q> to(Unit<Q> unit) {
      if (unit==this.unit) return this;
      UnitConverter cvtr = this.unit.getConverterTo(unit);
      return new _TwoDimensional<Q>(cvtr.convert(x), cvtr.convert(y), unit); 
    } 

}

class _ThreeDimensional<Q extends Quantity> extends VectorMeasure<Q> {
    
    final double x;
    
    final double y;
    
    final double z;
    
    final Unit<Q> unit;
    
    _ThreeDimensional(this.x, this.y, this.z, this.unit) : super._();
    
    @override
    double doubleValue(Unit<Q> unit) {
        double norm = Math.sqrt(x * x + y * y + z * z); 
        if (unit == this.unit) return norm;
        return this.unit.getConverterTo(unit).convert(norm);            
    }

    @override
    List<double> get value => [x,y,z];

    @override
    _ThreeDimensional<Q> to(Unit<Q> unit) {
        if (unit == this.unit) return this;
        UnitConverter cvtr = this.unit.getConverterTo(unit);
        return new _ThreeDimensional<Q>(cvtr.convert(x), cvtr.convert(y), cvtr.convert(z), unit); 
    } 

}

// Holds multi-dimensional implementation.
class _MultiDimensional<Q extends Quantity> extends VectorMeasure<Q> {
    
    final List<double> value;
    
    final Unit<Q> unit;
    
    _MultiDimensional(Iterable<double> components, this.unit) : 
      value = new UnmodifiableListView(components), super._();
    
    @override
    double doubleValue(Unit<Q> unit) {
        double normSquare = value[0] * value[0];
        for (int i=1, n=value.length; i < n;) {
            double d = value[i++];
            normSquare += d * d;
        }
        if (unit == this.unit)
            return Math.sqrt(normSquare);
        return this.unit.getConverterTo(unit).convert(Math.sqrt(normSquare));            
    }

    @override
    _MultiDimensional<Q> to(Unit<Q> unit) {
        if (unit==this.unit) return this;
        UnitConverter cvtr = this.unit.getConverterTo(unit);
        return new _MultiDimensional<Q>(value.map(cvtr.convert), unit); 
    } 

}

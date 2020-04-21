library measure.measure;

import 'unit.dart';
import 'dart:math' as math;
import 'package:collection/collection.dart';

/// The measurable, countable, or comparable property or aspect of a thing.
abstract class Measurable<Q extends Quantity>
    implements Comparable<Measurable<Q>> {
  const Measurable();

  /// Returns the value of this measurable stated in the specified unit as a
  /// `double`.
  double doubleValue(Unit unit);

  /// Returns the estimated integral value of this measurable stated in the
  /// specified unit as an `integer`.
  int intValue(Unit unit) => doubleValue(unit).round();

  /// The standard unit identifies the "type" of [Quantity] quantity for which
  /// this measurable is employed.
  Unit get standardUnit;

  @override
  int compareTo(Measurable<Q> other) => Comparable.compare(
      doubleValue(standardUnit), other.doubleValue(standardUnit));
}

/// The result of a measurement stated in a known unit.
abstract class Measure<V, Q extends Quantity> extends Measurable<Q> {
  const Measure();

  /// The measurement value of this measure.
  V get value;

  /// The measurement unit of this measure.
  Unit get unit;

  /// Returns the measure equivalent to this measure but stated in the
  /// specified unit.
  Measure<V, Q> to(Unit unit);

  @override
  Unit get standardUnit => unit;

  @override
  String toString() => '$value $unit';
}

/// Scalar measure.
class NumericMeasure<Q extends Quantity> extends Measure<num, Q> {
  @override
  final num value;

  @override
  final Unit unit;

  const NumericMeasure(this.value, this.unit) : super();

  @override
  Measure<num, Q> to(Unit unit) {
    if (unit == this.unit) return this;
    return NumericMeasure<Q>(doubleValue(unit), unit);
  }

  @override
  double doubleValue(Unit unit) {
    if (unit == this.unit) return value.toDouble();
    return this.unit.getConverterTo(unit).convert(value.toDouble());
  }
}

/// A measurement vector of two or more dimensions.
abstract class VectorMeasure<Q extends Quantity>
    extends Measure<List<double>, Q> {
  VectorMeasure._() : super();

  /// Creates a 2-dimensional measurement vector.
  factory VectorMeasure.twoDimensional(double x, double y, Unit unit) =
      _TwoDimensional<Q>;

  /// Creates a 3-dimensional measurement vector.
  factory VectorMeasure.threeDimensional(
      double x, double y, double z, Unit unit) = _ThreeDimensional<Q>;

  /// Creates a multi-dimensional measurement vector.
  factory VectorMeasure.multiDimensional(List<double> components, Unit unit) =
      _MultiDimensional<Q>;
}

class _TwoDimensional<Q extends Quantity> extends VectorMeasure<Q> {
  final double x;

  final double y;

  @override
  final Unit unit;

  _TwoDimensional(this.x, this.y, this.unit) : super._();

  @override
  double doubleValue(Unit unit) {
    var norm = math.sqrt(x * x + y * y);
    if (unit == this.unit) return norm;
    return this.unit.getConverterTo(unit).convert(norm);
  }

  @override
  List<double> get value => [x, y];

  @override
  _TwoDimensional<Q> to(Unit unit) {
    if (unit == this.unit) return this;
    var cvtr = this.unit.getConverterTo(unit);
    return _TwoDimensional<Q>(cvtr.convert(x), cvtr.convert(y), unit);
  }
}

class _ThreeDimensional<Q extends Quantity> extends VectorMeasure<Q> {
  final double x;

  final double y;

  final double z;

  @override
  final Unit unit;

  _ThreeDimensional(this.x, this.y, this.z, this.unit) : super._();

  @override
  double doubleValue(Unit unit) {
    var norm = math.sqrt(x * x + y * y + z * z);
    if (unit == this.unit) return norm;
    return this.unit.getConverterTo(unit).convert(norm);
  }

  @override
  List<double> get value => [x, y, z];

  @override
  _ThreeDimensional<Q> to(Unit unit) {
    if (unit == this.unit) return this;
    var cvtr = this.unit.getConverterTo(unit);
    return _ThreeDimensional<Q>(
        cvtr.convert(x), cvtr.convert(y), cvtr.convert(z), unit);
  }
}

// Holds multi-dimensional implementation.
class _MultiDimensional<Q extends Quantity> extends VectorMeasure<Q> {
  @override
  final List<double> value;

  @override
  final Unit unit;

  _MultiDimensional(Iterable<double> components, this.unit)
      : value = UnmodifiableListView(components),
        super._();

  @override
  double doubleValue(Unit unit) {
    var normSquare = value[0] * value[0];
    for (var i = 1, n = value.length; i < n;) {
      var d = value[i++];
      normSquare += d * d;
    }
    if (unit == this.unit) return math.sqrt(normSquare);
    return this.unit.getConverterTo(unit).convert(math.sqrt(normSquare));
  }

  @override
  _MultiDimensional<Q> to(Unit unit) {
    if (unit == this.unit) return this;
    var cvtr = this.unit.getConverterTo(unit);
    return _MultiDimensional<Q>(value.map(cvtr.convert), unit);
  }
}

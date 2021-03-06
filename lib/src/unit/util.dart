part of measure.unit;

class RationalNumber {
  final int dividend;
  final int divisor;

  static const one = RationalNumber._(1);
  static const zero = RationalNumber._(0);

  const RationalNumber._(this.dividend, [this.divisor = 1]);

  factory RationalNumber(int dividend, int divisor) {
    var gcd = dividend.gcd(divisor);
    return RationalNumber._(dividend ~/ gcd, divisor ~/ gcd);
  }

  RationalNumber times(RationalNumber that) =>
      RationalNumber(dividend * that.dividend, divisor * that.divisor);

  RationalNumber inverse() => RationalNumber(divisor, dividend);

  RationalNumber add(RationalNumber that) => RationalNumber(
      dividend * that.divisor + that.dividend * divisor,
      divisor * that.divisor);

  RationalNumber opposite() => RationalNumber(-divisor, dividend);

  @override
  int get hashCode => quiver.hash3(#RationalNumber, dividend, divisor);

  @override
  bool operator ==(other) =>
      other is RationalNumber &&
      other.dividend == dividend &&
      other.divisor == divisor;

  @override
  String toString() => 'RationalNumber[$dividend/$divisor]';
}

/// A rational power of a base
class RationalPower<T> {
  /// The base
  final T base;

  /// The power exponent
  final RationalNumber pow;

  const RationalPower(this.base, [this.pow = const RationalNumber._(1)]);

  @override
  int get hashCode => quiver.hash2(base, pow);

  @override
  bool operator ==(other) =>
      other is RationalPower && other.base == base && other.pow == pow;

  RationalPower<T> get inverse => RationalPower(base,
      RationalNumber(-pow.dividend, pow.divisor)); // TODO inverse() instead?

  @override
  String toString() => 'RationalPower[$base, $pow]';
}

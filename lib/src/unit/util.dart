part of measure;


class RationalNumber {

  final int dividend;
  final int divisor;

  const RationalNumber._(this.dividend, [this.divisor = 1]);

  factory RationalNumber(int dividend, int divisor) {
    var gcd = dividend.gcd(divisor);
    return new RationalNumber(dividend~/gcd, divisor~/gcd);
  }

  RationalNumber times(RationalNumber that) =>
      new RationalNumber(dividend * that.dividend, divisor * that.divisor);

  RationalNumber inverse() => new RationalNumber(divisor, dividend);

  RationalNumber add(RationalNumber that) =>
      new RationalNumber(dividend*that.divisor+that.dividend*divisor,divisor*that.divisor);

  RationalNumber opposite() => new RationalNumber(-divisor, dividend);

  int get hashCode => quiver.hash3(#RationalNumber, dividend, divisor);

}

/// A rational power of a base
class _RationalPower<T> {

  /// The base
  final T base;

  /// The power exponent
  final RationalNumber pow;

  const _RationalPower(this.base, [this.pow = const RationalNumber._(1)]);

  @override
  int get hashCode => quiver.hash2(base,pow);

  @override
  bool operator==(other) => other is _RationalPower&&other.base==base&&
      other.pow==pow;
}

part of measure;


class RationalNumber {

  final int dividend;
  final int divisor;

  const RationalNumber(this.dividend, [this.divisor = 1]);

  RationalNumber times(RationalNumber that) =>
      new RationalNumber(dividend*that.dividend, divisor*that.divisor); // TODO simplify

}

/// A rational power of a base
class _RationalPower<T> {

  /// The base
  final T base;

  /// The power exponent
  final RationalNumber pow;

  const _RationalPower(this.base, [this.pow = const RationalNumber(1)]);

  @override
  int get hashCode => quiver.hash2(base,pow);

  @override
  bool operator==(other) => other is _RationalPower&&other.base==base&&
      other.pow==pow;
}


part of measure;

/// A converter of numeric values.
///
/// It is not required for sub-classes to be immutable
/// (e.g. currency converter).
abstract class UnitConverter {

    /// The identity converter (unique).
    static const UnitConverter IDENTITY = const _IdentityConverter();

    const UnitConverter._();
    
    /// The inverse of this converter.
    UnitConverter get inverse;

    /// Converts a double value.
    ///
    /// Throws ConversionException if an error occurs during conversion.
    double convert(double x);

    /// Indicates if this converter is linear.
    ///
    /// A converter is linear if
    /// <code>convert(u + v) == convert(u) + convert(v)</code> and
    /// <code>convert(r * u) == r * convert(u)</code>.
    bool get isLinear;

    @override
    bool operator==(Object cvtr) => cvtr is UnitConverter&&this.concatenate(cvtr.inverse) is _IdentityConverter;
    // this might not work always because of limited precision, e.g. in case of extreme large multiplication factors
    

    @override
    int get hashCode => convert(1.0).hashCode;
    

    /// Concatenates this converter with another converter.
    ///
    /// The resulting converter is equivalent to first converting by the
    /// specified converter, and then converting by this converter.
    UnitConverter concatenate(UnitConverter converter) =>
        (converter is _IdentityConverter) ? this : new _CompoundConverter(converter, this);

}

class _IdentityConverter extends UnitConverter {

    const _IdentityConverter() : super._();
    
    @override
    UnitConverter get inverse => this;

    @override
    double convert(double x) => x;

    @override
    bool get isLinear => true;

    @override
    UnitConverter concatenate(UnitConverter converter) => converter;

    bool operator==(Object other) => other is _IdentityConverter;
    
    final int hashCode = 11;
}

class _CompoundConverter extends UnitConverter {

    final UnitConverter first;

    final UnitConverter second;

    const _CompoundConverter(this.first, this.second) : super._();

    @override
    UnitConverter get inverse => new _CompoundConverter(second.inverse, first.inverse);
    
    @override
    double convert(double x) => second.convert(first.convert(x));

    @override
    bool get isLinear => first.isLinear && second.isLinear;
    
    bool operator==(Object other) => other is _CompoundConverter&&first==other.first&&second==other.second;
  
}


/// A converter adding a constant offset (approximated as a <code>double</code>)
/// to numeric values.
class AddConverter extends UnitConverter {

    /// The offset value for this add converter.
    final double offset;

    const AddConverter._(this.offset) : super._();

    AddConverter(this.offset) : super._() {
        if (offset == 0.0)
            throw new ArgumentError("Identity converter not allowed");
    }

    
    @override
    UnitConverter get inverse => new AddConverter(- offset);
    
    @override
    double convert(double amount) => amount + offset;
    

    @override
    bool get isLinear => false;

    @override
    UnitConverter concatenate(UnitConverter converter) {
        if (converter is AddConverter) {
            double offset = this.offset + converter.offset;
            return _valueOf(offset);
        } else {
            return super.concatenate(converter);
        }
    }

    static UnitConverter _valueOf(double offset) {
        return offset == 0.0 ? UnitConverter.IDENTITY : new AddConverter(offset);
    }
    
    @override
    bool operator==(Object other) =>
        other is AddConverter&&offset==other.offset;
}

/// A logarithmic converter.
class LogConverter extends UnitConverter {

    /// The logarithmic base of this converter.
    final double base;

    /// The natural logarithm of the base.
    double get logBase => Math.log(base);

    /// The inverse of the natural logarithm of the base.
    double get invLogBase => 1.0 / logBase;

    const LogConverter(this.base) : super._();

    @override
    _InverseLogConverter get inverse => new _InverseLogConverter(this);

    @override
    double convert(double amount) => invLogBase * Math.log(amount);

    @override
    bool get isLinear => false;

    @override
    bool operator==(Object other) =>
        other is LogConverter&&base==other.base;
}

class _InverseLogConverter extends UnitConverter {

  final LogConverter inverse;
  
  const _InverseLogConverter(this.inverse) : super._();

  @override
  double convert(double amount) => Math.exp(inverse.logBase * amount);


  @override
  bool get isLinear => false;

  @override
  bool operator==(Object other) =>
      other is _InverseLogConverter&&inverse==other.inverse;


}

/// A converter multiplying numeric values by a constant scaling factor
/// (approximated as a <code>double</code>).
class MultiplyConverter extends UnitConverter {

    /// The scale factor.
    final double factor;

    const MultiplyConverter._(this.factor) : super._();


    @override
    UnitConverter get inverse => new MultiplyConverter._(1.0 / factor);
    

    @override
    double convert(double amount) => factor * amount;

    @override
    bool get isLinear => true;

    @override
    UnitConverter concatenate(UnitConverter converter) {
        if (converter is MultiplyConverter) {
            double factor = this.factor * converter.factor;
            return _valueOf(factor);
        } else if (converter is RationalConverter) {
            double factor = this.factor
                    * converter.factor.dividend
                    / converter.factor.divisor;
            return _valueOf(factor);
        } else {
            return super.concatenate(converter);
        }
    }

    static UnitConverter _valueOf(double factor) {
        return factor == 1.0 ? UnitConverter.IDENTITY
                : new MultiplyConverter._(factor);
    }
    
    @override
    bool operator==(Object other) =>
        other is MultiplyConverter&&factor==other.factor;
    

}

/// A converter multiplying numeric values by an exact scaling factor
/// (represented as the quotient of two integers.
class RationalConverter extends UnitConverter {

    /// The scale factor.
    final RationalNumber factor;

    const RationalConverter._(this.factor) : super._();


    @override
    UnitConverter get inverse => new RationalConverter._(factor.dividend < 0 ?
    new RationalNumber(-factor.divisor, -factor.dividend)
        : new RationalNumber(factor.divisor, factor.dividend));

    @override
    double convert(double amount) => amount * factor.dividend / factor.divisor;
    

    @override
    bool get isLinear => true;

    @override
    UnitConverter concatenate(UnitConverter converter) {
        if (converter is RationalConverter) {
            RationalConverter that = converter;
            int dividendLong = factor.dividend * that.factor.dividend;
            int divisorLong = factor.divisor * that.factor.divisor;
            var gcd = _gcd(dividendLong, divisorLong);
            return RationalConverter._valueOf(dividendLong ~/ gcd, divisorLong ~/ gcd);
        } else if (converter is MultiplyConverter) {
            return converter.concatenate(this);
        } else {
            return super.concatenate(converter);
        }
    }

    static UnitConverter _valueOf(int dividend, int divisor) {
        return (dividend == 1) && (divisor == 1) ? UnitConverter.IDENTITY
                : new RationalConverter._(new RationalNumber(dividend, divisor));
    }

    static int _gcd(int m, int n) => n==0 ? m : _gcd(n, m % n);

    
    @override
    bool operator==(Object other) =>
        other is RationalConverter&&factor==other.factor;
    

}

/// Signals that a problem of some sort has occurred either when creating a
/// converter between two units or during the conversion itself.
class ConversionError extends Error {
  final String message;
  ConversionError(this.message);
  String toString() => "Conversion exception: $message";
}

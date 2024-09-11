## 0.1.2+2

 - **REFACTOR**: support for petitparser ^6.0.0.

## 0.1.2+1

 - **REFACTOR**: support for intl ^0.19.0.

## 0.1.2

 - **FIX**: deriving quantity from product unit now works for more cases.
 - **FIX**: fill in missing quantities for units without symbol.
 - **FIX**: fill in missing quantities for si units definitions.
 - **FEAT**: added `baseUnit` getter that returns the unit in terms of base units.

## 0.1.1+1

 - **FIX**: Support intl '>=0.17.0 <0.19.0'.

## 0.1.1

 - **FEAT**: Support intl v0.18.0 and petitparser v5.0.0.


## 0.1.0

- Null safety
- Support for dart 2
- Remove dependency on package `typedparser`
- move implementation of `intValue` to Measurable
- rename constants to lower case versions
- make unit constructors public
- add unit converter const factories
- computations with units
- add units in quantity classes as static variables
- rename Duration quantity to DurationQuantity to avoid collision with core Duration class
- remove quantity type argument from Measure

## 0.0.1

- Initial version

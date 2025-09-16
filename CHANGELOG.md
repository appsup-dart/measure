# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2025-09-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`measure` - `v0.1.2+3`](#measure---v0123)

---

#### `measure` - `v0.1.2+3`

 - **REFACTOR**: set min sdk to 3.0.0. ([c12fbf7a](https://github.com/appsup-dart/measure/commit/c12fbf7a0df44d734ce09602744a923fc7766b1b))
 - **REFACTOR**: support for petitparser ^7.0.0. ([6b11d044](https://github.com/appsup-dart/measure/commit/6b11d0441cf553a8684229ab057a31dd0924b894))
 - **REFACTOR**: support for intl ^0.20.0. ([f2d8b063](https://github.com/appsup-dart/measure/commit/f2d8b0633b9fb486da94c7d9223227c21591068c))

## 0.1.2+3

 - **REFACTOR**: set min sdk to 3.0.0. ([c12fbf7a](https://github.com/appsup-dart/measure/commit/c12fbf7a0df44d734ce09602744a923fc7766b1b))
 - **REFACTOR**: support for petitparser ^7.0.0. ([6b11d044](https://github.com/appsup-dart/measure/commit/6b11d0441cf553a8684229ab057a31dd0924b894))
 - **REFACTOR**: support for intl ^0.20.0. ([f2d8b063](https://github.com/appsup-dart/measure/commit/f2d8b0633b9fb486da94c7d9223227c21591068c))

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

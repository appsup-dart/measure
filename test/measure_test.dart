import 'package:measure/measure.dart';
import 'package:test/test.dart';

void main() {
  group('Parsing and Formatting', () {
    var format = UnitFormat.standardUnitFormat;

    test('SI units', () {
      SI.unitsBySymbol.forEach((text, unit) {
        expect(format.format(unit), text);
        expect(format.parseSingleUnit(text), unit);
      });

      var derivedUnits = const {
        'm/s': SI.metresPerSecond,
        'm/s²': SI.metersPerSquareSecond,
        'm²': SI.squareMetre,
        'm³': SI.cubicMetre,
        'km': SI.kilometer,
        'cm': SI.centimeter,
        'mm': SI.millimeter
      };

      derivedUnits.forEach((text, unit) {
        expect(format.format(unit), text);
        expect(format.format(format.parseProductUnit(text)), text);
        expect(format.parseProductUnit(text), unit);
      });
    });
  });

  group('Resolving quantity of a unit', () {
    test('Resolving quantity of si units', () {
      for (var q in Quantities.values) {
        expect(q.siUnit.quantity, q);
      }
    });

    test('Resolving quantity of computed units', () {
      expect((Quantities.length.meter.times(Quantities.length.meter)).quantity,
          Quantities.area);
      expect(
          (Quantities.area.squareMetre.times(Quantities.length.meter)).quantity,
          Quantities.volume);
      expect(
          (Quantities.length.meter.divide(Quantities.duration.hour)).quantity,
          Quantities.velocity);
      expect(
          (Quantities.length.mile.divide(
                  Quantities.duration.hour.times(Quantities.duration.week)))
              .quantity,
          Quantities.acceleration);
      expect(Quantities.angle.grade.divide(Quantities.duration.hour).quantity,
          Quantities.angularVelocity);
    });
  });

  group('baseUnit', () {
    Unit baseUnit(
            {int m = 0,
            int kg = 0,
            int cd = 0,
            int A = 0,
            int s = 0,
            int K = 0,
            int mol = 0}) =>
        Unit.one
            .times(m == 0 ? Unit.one : SI.meter.pow(RationalNumber(m, 1)))
            .times(kg == 0 ? Unit.one : SI.kilogram.pow(RationalNumber(kg, 1)))
            .times(cd == 0 ? Unit.one : SI.candela.pow(RationalNumber(cd, 1)))
            .times(A == 0 ? Unit.one : SI.ampere.pow(RationalNumber(A, 1)))
            .times(s == 0 ? Unit.one : SI.second.pow(RationalNumber(s, 1)))
            .times(K == 0 ? Unit.one : SI.kelvin.pow(RationalNumber(K, 1)))
            .times(mol == 0 ? Unit.one : SI.mole.pow(RationalNumber(mol, 1)));

    test('SI units expressed in terms of base units', () {
      expect(SI.radian.baseUnit, baseUnit());
      expect(SI.steradian.baseUnit, baseUnit());
      expect(SI.hertz.baseUnit, baseUnit(s: -1));
      expect(SI.newton.baseUnit, baseUnit(m: 1, kg: 1, s: -2));
      expect(SI.pascal.baseUnit, baseUnit(m: -1, kg: 1, s: -2));
      expect(SI.joule.baseUnit, baseUnit(m: 2, kg: 1, s: -2));
      expect(SI.watt.baseUnit, baseUnit(m: 2, kg: 1, s: -3));
      expect(SI.coulomb.baseUnit, baseUnit(s: 1, A: 1));
      expect(SI.volt.baseUnit, baseUnit(m: 2, kg: 1, s: -3, A: -1));
      expect(SI.farad.baseUnit, baseUnit(m: -2, kg: -1, s: 4, A: 2));
      expect(SI.ohm.baseUnit, baseUnit(m: 2, kg: 1, s: -3, A: -2));
      expect(SI.siemens.baseUnit, baseUnit(m: -2, kg: -1, s: 3, A: 2));
      expect(SI.weber.baseUnit, baseUnit(m: 2, kg: 1, s: -2, A: -1));
      expect(SI.tesla.baseUnit, baseUnit(kg: 1, s: -2, A: -1));
      expect(SI.henry.baseUnit, baseUnit(m: 2, kg: 1, s: -2, A: -2));
      expect(SI.celsius.baseUnit, baseUnit(K: 1));
      expect(SI.lumen.baseUnit, baseUnit(cd: 1));
      expect(SI.lux.baseUnit, baseUnit(m: -2, cd: 1));
      expect(SI.becquerel.baseUnit, baseUnit(s: -1));
      expect(SI.gray.baseUnit, baseUnit(m: 2, s: -2));
      expect(SI.sievert.baseUnit, baseUnit(m: 2, s: -2));
      expect(SI.katal.baseUnit, baseUnit(s: -1, mol: 1));
    });

    test('derived SI units expressed in terms of base units', () {
      expect(Quantities.dynamicViscosity.siUnit.baseUnit,
          baseUnit(m: -1, kg: 1, s: -1));
      expect(Quantities.angularVelocity.siUnit.baseUnit, baseUnit(s: -1));
      expect(Quantities.angularAcceleration.siUnit.baseUnit, baseUnit(s: -2));
      expect(Quantities.dataRate.siUnit.baseUnit, baseUnit(s: -1));
      expect(
          Quantities.kinematicViscosity.siUnit.baseUnit, baseUnit(m: 2, s: -1));
      expect(Quantities.torque.siUnit.baseUnit, baseUnit(m: 2, kg: 1, s: -2));
    });
  });

  group('Math with units', () {
    test('Product of units', () {
      var a = SI.meter;
      var b = NonSI.percent;

      var c = a.times(b);

      expect(c.standardUnit, a);

      a = SI.metersPerSecond;
      b = SI.second;
      expect(a.times(b), SI.meter);
    });
  });
}

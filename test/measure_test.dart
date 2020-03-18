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
}

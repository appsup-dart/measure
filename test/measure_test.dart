import 'package:measure/measure.dart';
import 'package:test/test.dart';

void main() {
  group('Parsing and Formatting', () {

    var format = UnitFormat.standardUnitFormat;

    test('SI units', () {

      SI.unitsBySymbol.forEach((text, unit) {
        expect(format.format(unit),text);
        expect(format.parseSingleUnit(text), unit);
      });

      var derivedUnits = const {
        "m/s": SI.metresPerSecond,
        "m/s²": SI.metersPerSquareSecond,
        "m²": SI.squareMetre,
        "m³": SI.cubicMetre,
        "km": SI.kilometer,
        "cm": SI.centimeter,
        "mm": SI.millimeter
      };

      derivedUnits.forEach((text, unit) {
        expect(format.format(unit),text);
        expect(format.format(format.parseProductUnit(text)), text);
        expect(format.parseProductUnit(text), unit);
      });

    });

  });


  group('Resolving quantity of a unit', () {


    test('Resolving quantity of si units', () {

      for (var q in Quantity.values) {
        expect(q.siUnit.quantity,q);
      }

    });

    test('Resolving quantity of computed units', () {
      expect((Quantity.length.meter.times(Quantity.length.meter)).quantity, Quantity.area);
      expect((Quantity.area.squareMetre.times(Quantity.length.meter)).quantity, Quantity.volume);
      expect((Quantity.length.meter.divide(Quantity.duration.hour)).quantity, Quantity.velocity);
      expect((Quantity.length.mile.divide(Quantity.duration.hour.times(Quantity.duration.week))).quantity, Quantity.acceleration);
      expect(Quantity.angle.grade.divide(Quantity.duration.hour).quantity, Quantity.angularVelocity);
    });
  });
}

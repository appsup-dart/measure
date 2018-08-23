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
}

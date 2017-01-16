part of measure;

/// The units created by combining or transforming other units.
abstract class DerivedUnit<Q extends Quantity> extends Unit<Q> {

    const DerivedUnit._() : super._();
}
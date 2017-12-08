
part of measure;


/// A type of quantitative properties or attributes of thing.
///
/// Mass, time, distance, heat, and angular separation are among the familiar
/// examples of quantitative properties.
///
/// Distinct quantities have usually different physical dimensions; although it
/// is not required nor necessary, for example [Torque] and [Energy] have same
/// dimension but are of different nature (vector for torque, scalar for
/// energy).
abstract class Quantity {
    
}

/// A dimensionless quantity.
abstract class Dimensionless extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Dimensionless> unit = Unit.one;

}

/// The rate of change of velocity with respect to time.
///
/// The system unit for this quantity is "m/s²" (meter per square second).
abstract class Acceleration extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Acceleration> unit = SI.metresPerSquareSecond;
}


/// The number of elementary entities (molecules, for example) of a substance.
///
/// The system unit for this quantity is "mol" (mole).
abstract class AmountOfSubstance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<AmountOfSubstance> unit = SI.mole;

}

/// The figure formed by two lines diverging from a common point.
///
/// The system unit for this quantity is "rad" (radian). This quantity is
/// dimensionless.
abstract class Angle extends Dimensionless {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Angle> unit = SI.radian;

}

/// The rate of change of angular velocity with respect to time.
///
/// The system unit for this quantity is "rad/s²" (radian per square second).
abstract class AngularAcceleration extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<AngularAcceleration> unit =
        const ProductUnit<AngularAcceleration>._(const [
            const _RationalPower<Unit>(SI.radian),
            const _RationalPower<Unit>(SI.second, const RationalNumber._(-2))
        ]);

}

/// The rate of change of angular displacement with respect to time.
///
/// The system unit for this quantity is "rad/s" (radian per second).
abstract class AngularVelocity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<AngularVelocity> unit =
    const ProductUnit<AngularVelocity>._(const [
        const _RationalPower<Unit>(SI.radian),
        const _RationalPower<Unit>(SI.second, const RationalNumber._(-1))
    ]);

}

/// The extent of a planar region or of the surface of a solid measured in
/// square units.
///
/// The system unit for this quantity is "m²" (square meter).
abstract class Area extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Area> unit = SI.squareMetre;

}

/// A catalytic activity.
///
/// The system unit for this quantity is "kat" (katal).
abstract class CatalyticActivity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<CatalyticActivity> unit = SI.katal;

}

/// A measure of data amount.
///
/// The system unit for this quantity is "bit". This quantity is dimensionless.
abstract class DataAmount extends Dimensionless {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<DataAmount> unit = SI.bit;

}

/// The speed of data-transmission.
///
/// The system unit for this quantity is "bit/s" (bit per second).
abstract class DataRate extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<DataRate> unit = const ProductUnit<DataRate>._(
        const [
            const _RationalPower<Unit>(SI.bit),
            const _RationalPower<Unit>(SI.second,const RationalNumber._(-1))
        ]);

}

/// A period of existence or persistence.
///
/// The system unit for this quantity is "s" (second).
abstract class Duration extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Duration> unit = SI.second;

}

/// The dynamic viscosity.
///
/// The system unit for this quantity is "Pa·s" (Pascal-Second).
abstract class DynamicViscosity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<DynamicViscosity> unit
       = const ProductUnit<DynamicViscosity>._(const [
           const _RationalPower<Unit>(SI.pascal),
           const _RationalPower<Unit>(SI.second)
       ]);
}

/// An electric capacitance.
///
/// The system unit for this quantity is "F" (Farad).
abstract class ElectricCapacitance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricCapacitance> unit = SI.farad;

}

/// An electric charge.
///
/// The system unit for this quantity is "C" (Coulomb).
abstract class ElectricCharge extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricCharge> unit = SI.coulomb;

}


/// An electric conductance.
///
/// The system unit for this quantity "S" (Siemens).
abstract class ElectricConductance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricConductance> unit = SI.siemens;

}

/// The amount of electric charge flowing past a specified circuit point per
/// unit time.
///
/// The system unit for this quantity is "A" (Ampere).
abstract class ElectricCurrent extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricCurrent> unit = SI.ampere;

}

/// An electric inductance.
///
/// The system unit for this quantity is "H" (Henry).
abstract class ElectricInductance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricInductance> unit = SI.henry;

}

/// An electric potential or electromotive force.
///
/// The system unit for this quantity is "V" (Volt).
abstract class ElectricPotential extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricPotential> unit = SI.volt;

}

/// An electric resistance.
///
/// The system unit for this quantity is "Ω" (Ohm).
abstract class ElectricResistance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricResistance> unit = SI.ohm;

}

/// The capacity of a physical system to do work.
///
/// The system unit for this quantity "J" (Joule).
abstract class Energy extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Energy> unit = SI.joule;

}

/// A quantity that tends to produce an acceleration of a body in the direction
/// of its application.
///
/// The system unit for this quantity is "N" (Newton).
abstract class Force extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Force> unit = SI.newton;

}

/// The number of times a specified phenomenon occurs within a specified
/// interval.
///
/// The system unit for this quantity is "Hz" (Hertz).
abstract class Frequency extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Frequency> unit = SI.hertz;

}

/// An illuminance.
///
/// The system unit for this quantity is "lx" (lux).
abstract class Illuminance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Illuminance> unit = SI.lux;

}

/// The diffusion of momentum.
///
/// The system unit for this quantity is "m²/s".
abstract class KinematicViscosity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<KinematicViscosity> unit
    = const ProductUnit<KinematicViscosity>._(const [
        const _RationalPower<Unit>(SI.metre,const RationalNumber._(2)),
        const _RationalPower<Unit>(SI.second,const RationalNumber._(-1))
    ]);

}

/// The extent of something along its greatest dimension or the extent of space
/// between two objects or places.
///
/// The system unit for this quantity is "m" (meter).
abstract class Length extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Length> unit = SI.metre;

}

/// A luminous flux.
///
/// The system unit for this quantity is "lm" (lumen).
abstract class LuminousFlux extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<LuminousFlux> unit = SI.lumen;

}

/// The luminous flux density per solid angle as measured in a given direction
/// relative to the emitting source.
///
/// The system unit for this quantity is "cd" (candela).
abstract class LuminousIntensity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<LuminousIntensity> unit = SI.candela;

}

/// A magnetic flux.
///
/// The system unit for this quantity is "Wb" (Weber).
abstract class MagneticFlux extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<MagneticFlux> unit = SI.weber;

}

/// A magnetic flux density.
///
/// The system unit for this quantity is "T" (Tesla).
abstract class MagneticFluxDensity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<MagneticFluxDensity> unit = SI.tesla;

}

/// The measure of the quantity of matter that a body or an object contains.
///
/// The mass of the body is not dependent on gravity and therefore is different
/// from but proportional to its weight.
///
/// The system unit for this quantity is "kg" (kilogram).
abstract class Mass extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Mass> unit = SI.kilogram;

}

/// The movement of mass per time.
///
/// The system unit for this quantity is "kg/s" (kilogram per second).
abstract class MassFlowRate extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<MassFlowRate> unit = const ProductUnit<MassFlowRate>._(
        const [
            const _RationalPower(SI.kilogram),
            const _RationalPower(SI.second,const RationalNumber._(-1))
        ]
    );
}

/// The rate at which work is done.
///
/// The system unit for this quantity is "W" (Watt).
abstract class Power extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Power> unit = SI.watt;

}

/// A force applied uniformly over a surface.
///
/// The system unit for this quantity is "Pa" (Pascal).
abstract class Pressure extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Pressure> unit = SI.pascal;

}

/// The amount of energy deposited per unit of mass.
///
/// The system unit for this quantity is "Gy" (Gray).
abstract class RadiationDoseAbsorbed extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<RadiationDoseAbsorbed> unit = SI.gray;

}

/// The effective (or "equivalent") dose of radiation received by a human or
/// some other living organism.
///
/// The system unit for this quantity is "Sv" (Sievert).
abstract class RadiationDoseEffective extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<RadiationDoseEffective> unit = SI.sievert;

}

/// A radioactive activity.
///
/// The system unit for this quantity is "Bq" (Becquerel).
abstract class RadioactiveActivity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<RadioactiveActivity> unit = SI.becquerel;

}


/// The angle formed by three or more planes intersecting at a common point.
///
/// The system unit for this quantity is "sr" (steradian).
abstract class SolidAngle extends Dimensionless {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<SolidAngle> unit = SI.steradian;

}

/// The degree of hotness or coldness of a body or an environment.
///
/// The system unit for this quantity is "K" (Kelvin).
abstract class Temperature extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Temperature> unit = SI.kelvin;

}

/// The moment of a force.
///
/// The system unit for this quantity is "N·m" (Newton-Meter).
///
/// Note: The Newton-metre ("N·m") is also a way of exressing a Joule (unit of
/// energy). However, torque is not energy. So, to avoid confusion, we will use
/// the units "N·m" for torque and not "J". This distinction occurs due to the
/// scalar nature of energy and the vector nature of torque.
abstract class Torque extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Torque> unit =
        const ProductUnit<Torque>._(const [
            const _RationalPower<Unit>(SI.newton),
            const _RationalPower<Unit>(SI.metre)
        ]);

}


/// A distance traveled divided by the time of travel.
///
/// The system unit for this quantity is "m/s" (meter per second).
abstract class Velocity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Velocity> unit = SI.metresPerSecond;

}

/// The amount of space occupied by a three-dimensional object or region of
/// space, expressed in cubic units.
///
/// The system unit for this quantity is "m³" (cubic meter).
abstract class Volume extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Volume> unit = SI.cubicMetre;

}

/// A mass per unit volume of a substance under specified conditions of pressure
/// and temperature.
///
/// The system unit for this quantity is "kg/m³" (kilogram per cubic meter).
abstract class VolumetricDensity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<VolumetricDensity> unit =
    const ProductUnit<VolumetricDensity>._(const [
        const _RationalPower(SI.kilogram),
        const _RationalPower(SI.metre,const RationalNumber._(-3))
    ]);
}

/// The volume of fluid passing a point in a system per unit of time.
///
/// The system unit for this quantity is "m³/s" (cubic meter per second).
abstract class VolumetricFlowRate extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<VolumetricFlowRate> unit =
    const ProductUnit<VolumetricFlowRate>._(const [
        const _RationalPower(SI.metre,const RationalNumber._(3)),
        const _RationalPower(SI.second,const RationalNumber._(-1))
    ]);
}


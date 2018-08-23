
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

    static const dimensionless = const Dimensionless._();

    static const acceleration = const Acceleration._();

    static const amountOfSubstance = const AmountOfSubstance._();

    static const angle = const Angle._();

    static const angularAcceleration = const AngularAcceleration._();

    static const angularVelocity = const AngularVelocity._();

    static const area = const Area._();

    static const catalyticActivity = const CatalyticActivity._();

    static const dataAmount = const DataAmount._();

    static const dataRate = const DataRate._();

    static const duration = const DurationQuantity._();

    static const dynamicViscosity = const DynamicViscosity._();

    static const electricCapacitance = const ElectricCapacitance._();

    static const electricCharge = const ElectricCharge._();

    static const electricConductance = const ElectricConductance._();

    static const electricCurrent = const ElectricCurrent._();

    static const electricInductance = const ElectricInductance._();

    static const electricPotential = const ElectricPotential._();

    static const electricResistance = const ElectricResistance._();

    static const energy = const Energy._();

    static const force = const Force._();

    static const frequency = const Frequency._();

    static const illuminance = const Illuminance._();

    static const kinematicViscosity = const KinematicViscosity._();

    static const length = const Length._();

    static const luminousFlux = const LuminousFlux._();

    static const luminousIntensity = const LuminousIntensity._();

    static const magneticFlux = const MagneticFlux._();

    static const magneticFluxDensity = const MagneticFluxDensity._();

    static const mass = const Mass._();

    static const massFlowRate = const MassFlowRate._();

    static const power = const Power._();

    static const pressure = const Pressure._();

    static const radiationDoseAbsorbed = const RadiationDoseAbsorbed._();

    static const radiationDoseEffective = const RadiationDoseEffective._();

    static const radioactiveActivity = const RadioactiveActivity._();

    static const solidAngle = const SolidAngle._();

    static const temperature = const Temperature._();

    static const torque = const Torque._();

    static const velocity = const Velocity._();

    static const volume = const Volume._();

    static const volumetricDensity = const VolumetricDensity._();

    const Quantity();

}

/// A dimensionless quantity.
class Dimensionless extends Quantity {

    const Dimensionless._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = Unit.one;

    /// A dimensionless unit equals to `0.01` (standard name `%`).
    static const Unit percent = NonSI.percent;

    /// A logarithmic unit used to describe a ratio (standard name `dB`).
    static const Unit decibel = NonSI.decibel;

}

/// The rate of change of velocity with respect to time.
///
/// The system unit for this quantity is "m/s²" (meter per square second).
class Acceleration extends Quantity {

    const Acceleration._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.metresPerSquareSecond;

    /// The metric unit for acceleration quantities (`m/s²`).
    static const Unit metresPerSquareSecond = SI.metresPerSquareSecond;

    /// Equivalent to [metresPerSquareSecond] (American spelling).
    static const Unit metersPerSquareSecond = metresPerSquareSecond;

    /// A unit of acceleration equal to the gravity at the earth's surface
    /// (standard name `grav`).
    static const Unit g = NonSI.g;
}


/// The number of elementary entities (molecules, for example) of a substance.
///
/// The system unit for this quantity is "mol" (mole).
class AmountOfSubstance extends Quantity {

    const AmountOfSubstance._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.mole;

    /// The base unit for amount of substance quantities (`mol`).
    ///
    /// The mole is the amount of substance of a system which contains as many
    /// elementary entities as there are atoms in 0.012 kilogram of carbon 12.
    static const BaseUnit mole = SI.mole;

    /// A unit of amount of substance equals to one atom (standard name `atom`).
    static const Unit atom =  NonSI.atom;

}

/// The figure formed by two lines diverging from a common point.
///
/// The system unit for this quantity is "rad" (radian). This quantity is
/// dimensionless.
class Angle extends Dimensionless {

    const Angle._(): super._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.radian;

    /// The unit for plane angle quantities (`rad`).
    ///
    /// One radian is the angle between two radii of a circle such that the
    /// length of the arc between them is equal to the radius.
    static const AlternateUnit radian = SI.radian;

    /// A unit of angle equal to a full circle or `2<i>&pi;</i> [SI.RADIAN]`
    /// (standard name `rev`).
    static const Unit revolution = NonSI.revolution;

    /// A unit of angle equal to `1/360 [REVOLUTION]` (standard name `°`).
    static const Unit degreeAngle = NonSI.degreeAngle;

    /// A unit of angle equal to `1/60 [DEGREE_ANGLE]` (standard name `′`).
    static const Unit minuteAngle = NonSI.minuteAngle;

    /// A unit of angle equal to `1/60 [MINUTE_ANGLE]` (standard name `"`).
    static const Unit secondAngle = NonSI.secondAngle;

    /// A unit of angle equal to `0.01 [SI.RADIAN]` (standard name `centiradian`).
    static const Unit centiradian = NonSI.centiradian;

    /// A unit of angle measure equal to `1/400 [REVOLUTION]`
    /// (standard name `grade`).
    static const Unit grade = NonSI.grade;

}

/// The rate of change of angular velocity with respect to time.
///
/// The system unit for this quantity is "rad/s²" (radian per square second).
class AngularAcceleration extends Quantity {

    const AngularAcceleration._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit =
        const ProductUnit._(const [
            const RationalPower<Unit>(SI.radian),
            const RationalPower<Unit>(SI.second, const RationalNumber._(-2))
        ]);

}

/// The rate of change of angular displacement with respect to time.
///
/// The system unit for this quantity is "rad/s" (radian per second).
class AngularVelocity extends Quantity {

    const AngularVelocity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit =
    const ProductUnit._(const [
        const RationalPower<Unit>(SI.radian),
        const RationalPower<Unit>(SI.second, const RationalNumber._(-1))
    ]);

}

/// The extent of a planar region or of the surface of a solid measured in
/// square units.
///
/// The system unit for this quantity is "m²" (square meter).
class Area extends Quantity {

    const Area._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.squareMetre;

    /// The metric unit for area quantities (`m²`).
    static const Unit squareMetre = SI.squareMetre;

    /// A unit of area equal to `100 m²`
    /// (standard name `a`).
    static const Unit are = NonSI.are;

    /// A unit of area equal to `100 [ARE]`
    /// (standard name `ha`).
    static const Unit hectare = NonSI.hectare;

}

/// A catalytic activity.
///
/// The system unit for this quantity is "kat" (katal).
class CatalyticActivity extends Quantity {

    const CatalyticActivity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.katal;

    /// The derived unit for catalytic activity (`kat`).
    static const AlternateUnit katal = SI.katal;
}

/// A measure of data amount.
///
/// The system unit for this quantity is "bit". This quantity is dimensionless.
class DataAmount extends Dimensionless {

    const DataAmount._() : super._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.bit;

    /// The unit for binary information (`bit`).
    static const AlternateUnit bit = SI.bit;

    /// A unit of data amount equal to `8 [SI.BIT]`
    /// (BinarY TErm, standard name `byte`).
    static const Unit byte = NonSI.byte;

    /// Equivalent [byte]
    static const Unit octet = byte;

}

/// The speed of data-transmission.
///
/// The system unit for this quantity is "bit/s" (bit per second).
class DataRate extends Quantity {

    const DataRate._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = const ProductUnit._(
        const [
            const RationalPower<Unit>(SI.bit),
            const RationalPower<Unit>(SI.second,const RationalNumber._(-1))
        ]);

}

/// A period of existence or persistence.
///
/// The system unit for this quantity is "s" (second).
class DurationQuantity extends Quantity {

    const DurationQuantity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.second;

    /// The base unit for duration quantities (`s`).
    ///
    /// It is defined as the duration of 9,192,631,770 cycles of radiation
    /// corresponding to the transition between two hyperfine levels of
    /// the ground state of cesium (1967 Standard).
    static const BaseUnit second = SI.second;

    /// A unit of duration equal to `60 s` (standard name `min`).
    static const Unit minute = NonSI.minute;

    /// A unit of duration equal to `60 [MINUTE]` (standard name `h`).
    static const Unit hour = NonSI.hour;

    /// A unit of duration equal to `24 [HOUR]` (standard name `d`).
    static const Unit day = NonSI.day;

    /// A unit of duration equal to `7 [DAY]` (standard name `week`).
    static const Unit week = NonSI.week;

    /// A unit of duration equal to 365 days, 5 hours, 49 minutes,
    /// and 12 seconds (standard name `year`).
    static const Unit year = NonSI.year;

    /// A unit of duration equal to one twelfth of a year (standard name `month`).
    static const Unit month = NonSI.month;

    /// A unit of duration equal to the time required for a complete rotation of
    /// the earth in reference to any star or to the vernal equinox at the
    /// meridian, equal to 23 hours, 56 minutes, 4.09 seconds
    /// (standard name `day_sidereal`).
    static const Unit daySidereal = NonSI.daySidereal;

    /// A unit of duration equal to one complete revolution of the
    /// earth about the sun, relative to the fixed stars, or 365 days, 6 hours,
    /// 9 minutes, 9.54 seconds (standard name `year_sidereal`).
    static const Unit yearSidereal = NonSI.yearSidereal;

    /// A unit of duration equal to `365 [DAY]` (standard name `year_calendar`).
    static const Unit yearCalendar = NonSI.yearCalendar;

}

/// The dynamic viscosity.
///
/// The system unit for this quantity is "Pa·s" (Pascal-Second).
class DynamicViscosity extends Quantity {

    const DynamicViscosity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit unit
       = const ProductUnit._(const [
           const RationalPower<Unit>(SI.pascal),
           const RationalPower<Unit>(SI.second)
       ]);

    /// A unit of dynamic viscosity equal to `1 g/(cm·s)` (cgs unit).
    static const Unit poise = NonSI.poise;

}

/// An electric capacitance.
///
/// The system unit for this quantity is "F" (Farad).
class ElectricCapacitance extends Quantity {

    const ElectricCapacitance._();


    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.farad;

    /// The derived unit for capacitance (`F`).
    ///
    /// One Farad is equal to the capacitance of a capacitor having an equal
    /// and opposite charge of 1 coulomb on each plate and a potential difference
    /// of 1 volt between the plates. It is named after the British physicist
    /// and chemist Michael Faraday (1791-1867).
    static const AlternateUnit farad = SI.farad;
}

/// An electric charge.
///
/// The system unit for this quantity is "C" (Coulomb).
class ElectricCharge extends Quantity {

    const ElectricCharge._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.coulomb;

    /// The derived unit for electric charge, quantity of electricity
    /// (`C`).
    ///
    /// One Coulomb is equal to the quantity of charge transferred in one second
    /// by a steady current of one ampere. It is named after the French physicist
    /// Charles Augustin de Coulomb (1736-1806).
    static const AlternateUnit coulomb = SI.coulomb;

    /// A unit of electric charge equal to the charge on one electron
    /// (standard name `e`).
    static const Unit e = NonSI.e;

    /// A unit of electric charge equal to equal to the product of Avogadro's
    /// number (see [mole]) and the charge (1 e) on a single electron
    /// (standard name `Fd`).
    static const Unit faraday = NonSI.faraday;

    /// A unit of electric charge which exerts a force of one dyne on an equal
    /// charge at a distance of one centimeter (standard name `Fr`).
    static const Unit franklin = NonSI.franklin;


}


/// An electric conductance.
///
/// The system unit for this quantity "S" (Siemens).
class ElectricConductance extends Quantity {

    const ElectricConductance._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.siemens;

    /// The derived unit for electric conductance (`S`).
    ///
    /// One Siemens is equal to one ampere per volt. It is named after
    /// the German engineer Ernst Werner von Siemens (1816-1892).
    static const AlternateUnit siemens = SI.siemens;

}

/// The amount of electric charge flowing past a specified circuit point per
/// unit time.
///
/// The system unit for this quantity is "A" (Ampere).
class ElectricCurrent extends Quantity {

    const ElectricCurrent._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.ampere;

    /// The base unit for electric current quantities (`A`).
    ///
    /// The Ampere is that constant current which, if maintained in two straight
    /// parallel conductors of infinite length, of negligible circular
    /// cross-section, and placed 1 metre apart in vacuum, would produce between
    /// these conductors a force equal to 2 × 10-7 newton per metre of length.
    ///
    /// It is named after the French physicist Andre Ampere (1775-1836).
    static const BaseUnit ampere = SI.ampere;

    /// A unit of electric charge equal to the centimeter-gram-second
    /// electromagnetic unit of magnetomotive force, equal to `10/4
    /// &pi;ampere-turn` (standard name `Gi`).
    static const Unit gilbert = NonSI.gilbert;

}

/// An electric inductance.
///
/// The system unit for this quantity is "H" (Henry).
class ElectricInductance extends Quantity {

    const ElectricInductance._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.henry;

    /// The derived unit for inductance (`H`).
    ///
    /// One Henry is equal to the inductance for which an induced electromotive
    /// force of one volt is produced when the current is varied at the rate of
    /// one ampere per second. It is named after the American physicist
    /// Joseph Henry (1791-1878).
    static const AlternateUnit henry = SI.henry;
}

/// An electric potential or electromotive force.
///
/// The system unit for this quantity is "V" (Volt).
class ElectricPotential extends Quantity {

    const ElectricPotential._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.volt;

    /// The derived unit for electric potential difference, electromotive force
    /// (`V`).
    ///
    /// One Volt is equal to the difference of electric potential between two
    /// points on a conducting wire carrying a constant current of one ampere
    /// when the power dissipated between the points is one watt. It is named
    /// after the Italian physicist Count Alessandro Volta (1745-1827).
    static const AlternateUnit volt = SI.volt;

}

/// An electric resistance.
///
/// The system unit for this quantity is "Ω" (Ohm).
class ElectricResistance extends Quantity {

    const ElectricResistance._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.ohm;

    /// The derived unit for electric resistance (`Ω` or `Ohm`).
    ///
    /// One Ohm is equal to the resistance of a conductor in which a current of
    /// one ampere is produced by a potential of one volt across its terminals.
    /// It is named after the German physicist Georg Simon Ohm (1789-1854).
    static const AlternateUnit ohm = SI.ohm;

}

/// The capacity of a physical system to do work.
///
/// The system unit for this quantity "J" (Joule).
class Energy extends Quantity {

    const Energy._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.joule;

    /// The derived unit for energy, work, quantity of heat (`J`).
    ///
    /// One joule is the amount of work done when an applied force of 1 newton
    /// moves through a distance of 1 metre in the direction of the force.
    /// It is named after the English physicist James Prescott Joule (1818-1889).
    static const AlternateUnit joule = SI.joule;

    /// A unit of energy equal to `1E-7 J`
    /// (standard name `erg`).
    static const Unit erg = NonSI.erg;

    /// A unit of energy equal to one electron-volt (standard name
    /// `eV`, also recognized `keV, MeV, GeV`).
    static const Unit electronVolt = NonSI.electronVolt;

}

/// A quantity that tends to produce an acceleration of a body in the direction
/// of its application.
///
/// The system unit for this quantity is "N" (Newton).
class Force extends Quantity {

    const Force._();


    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.newton;

    /// The derived unit for force (`N`).
    ///
    /// One newton is the force required to give a mass of 1 kilogram an Force
    /// of 1 metre per second per second. It is named after the English
    /// mathematician and physicist Sir Isaac Newton (1642-1727).
    static const AlternateUnit newton = SI.newton;

    /// A unit of force equal to `1E-5 N`
    /// (standard name `dyn`).
    static const Unit dyne = NonSI.dyne;

    /// A unit of force equal to `9.80665 N`
    /// (standard name `kgf`).
    static const Unit kilogramForce = NonSI.kilogramForce;

    /// A unit of force equal to `[POUND]·[G]`
    /// (standard name `lbf`).
    static const Unit poundForce = NonSI.poundForce;

}

/// The number of times a specified phenomenon occurs within a specified
/// interval.
///
/// The system unit for this quantity is "Hz" (Hertz).
class Frequency extends Quantity {

    const Frequency._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.hertz;

    /// The derived unit for frequency (`Hz`).
    ///
    /// A unit of frequency equal to one cycle per second.
    /// After Heinrich Rudolf Hertz (1857-1894), German physicist who was the
    /// first to produce radio waves artificially.
    static const AlternateUnit hertz = SI.hertz;

}

/// An illuminance.
///
/// The system unit for this quantity is "lx" (lux).
class Illuminance extends Quantity {

    const Illuminance._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.lux;

    /// The derived unit for illuminance (`lx`).
    ///
    /// One Lux is equal to one lumen per square meter.
    static const AlternateUnit lux = SI.lux;

    /// A unit of illuminance equal to `1E4 Lx`
    /// (standard name `La`).
    static const Unit lambert = NonSI.lambert;

}

/// The diffusion of momentum.
///
/// The system unit for this quantity is "m²/s".
class KinematicViscosity extends Quantity {

    const KinematicViscosity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit unit
    = const ProductUnit._(const [
        const RationalPower<Unit>(SI.metre,const RationalNumber._(2)),
        const RationalPower<Unit>(SI.second,const RationalNumber._(-1))
    ]);

    /// A unit of kinematic viscosity equal to `1 cm²/s` (cgs unit).
    static const Unit stoke = NonSI.stoke;

}

/// The extent of something along its greatest dimension or the extent of space
/// between two objects or places.
///
/// The system unit for this quantity is "m" (meter).
class Length extends Quantity {

    const Length._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.metre;

    /// Equivalent to `KILO(METRE)`.
    static const Unit kilometre = SI.kilometre;

    /// Equivalent to [kilometre] (American spelling).
    static const Unit kilometer = kilometre;

    /// Equivalent to `CENTI(METRE)`.
    static const Unit centimetre = SI.centimetre;

    /// Equivalent to [centimetre] (American spelling).
    static const Unit centimeter = centimetre;

    /// Equivalent to `MILLI(METRE)`.
    static const Unit millimetre = SI.millimetre;

    /// Equivalent to [millimetre] (American spelling).
    static const Unit millimeter = millimetre;

    /// The base unit for length quantities (`m`).
    ///
    /// One meter was redefined in 1983 as the distance traveled by light in
    /// a vacuum in 1/299,792,458 of a second.
    static const BaseUnit metre = SI.metre;

    /// Equivalent to [metre] (American spelling).
    static const Unit meter = metre;

    /// A unit of length equal to `0.3048 m` (standard name `ft`).
    static const Unit foot = NonSI.foot;

    /// A unit of length equal to `1200/3937 m` (standard name `foot_survey_us`).
    static const Unit footSurveyUS = NonSI.footSurveyUS;

    /// A unit of length equal to `0.9144 m` (standard name `yd`).
    static const Unit yard = NonSI.yard;

    /// A unit of length equal to `0.0254 m` (standard name `in`).
    static const Unit inch = NonSI.inch;

    /// A unit of length equal to `1609.344 m` (standard name `mi`).
    static const Unit mile = NonSI.mile;

    /// A unit of length equal to `1852.0 m` (standard name `nmi`).
    static const Unit nauticalMile = NonSI.nauticalMile;

    /// A unit of length equal to `1E-10 m` (standard name `Å`).
    static const Unit angstrom = NonSI.angstrom;

    /// A unit of length equal to the average distance from the center of the
    /// Earth to the center of the Sun (standard name `ua`).
    static const Unit astronomicalUnit = NonSI.astronomicalUnit;

    /// A unit of length equal to the distance that light travels in one year
    /// through a vacuum (standard name `ly`).
    static const Unit lightYear = NonSI.lightYear;

    /// A unit of length equal to the distance at which a star would appear to
    /// shift its position by one arcsecond over the course the time
    /// (about 3 months) in which the Earth moves a distance of
    /// [astronomicalUnit] in the direction perpendicular to the
    /// direction to the star (standard name `pc`).
    static const Unit parsec = NonSI.parsec;

    /// A unit of length equal to `0.013837 [INCH]` exactly (standard name `pt`).
    static const Unit point = NonSI.point;

    /// A unit of length equal to `1/72 [INCH]` (standard name `pixel`).
    ///
    /// It is the American point rounded to an even 1/72 inch.
    static const Unit pixel = NonSI.pixel;

    /// Equivalent [pixel]
    static const Unit computerPoint = pixel;

}

/// A luminous flux.
///
/// The system unit for this quantity is "lm" (lumen).
class LuminousFlux extends Quantity {

    const LuminousFlux._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.lumen;

    /// The derived unit for luminous flux (`lm`).
    ///
    /// One Lumen is equal to the amount of light given out through a solid angle
    /// by a source of one candela intensity radiating equally in all directions.
    static const AlternateUnit lumen = SI.lumen;
}

/// The luminous flux density per solid angle as measured in a given direction
/// relative to the emitting source.
///
/// The system unit for this quantity is "cd" (candela).
class LuminousIntensity extends Quantity {

    const LuminousIntensity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.candela;

    /// The base unit for luminous intensity quantities (`cd`).
    ///
    /// The candela is the luminous intensity, in a given direction,
    /// of a source that emits monochromatic radiation of frequency
    /// 540 × 1012 hertz and that has a radiant intensity in that
    /// direction of 1/683 watt per steradian.
    static const BaseUnit candela = SI.candela;

}

/// A magnetic flux.
///
/// The system unit for this quantity is "Wb" (Weber).
class MagneticFlux extends Quantity {

    const MagneticFlux._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.weber;

    /// The derived unit for magnetic flux (`Wb`).
    ///
    /// One Weber is equal to the magnetic flux that in linking a circuit of one
    /// turn produces in it an electromotive force of one volt as it is uniformly
    /// reduced to zero within one second. It is named after the German physicist
    /// Wilhelm Eduard Weber (1804-1891).
    static const AlternateUnit weber = SI.weber;

    /// A unit of magnetic flux equal `1E-8 Wb`
    /// (standard name `Mx`).
    static const Unit maxwell = NonSI.maxwell;

}

/// A magnetic flux density.
///
/// The system unit for this quantity is "T" (Tesla).
class MagneticFluxDensity extends Quantity {

    const MagneticFluxDensity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.tesla;

    /// The derived unit for magnetic flux density (`T`).
    ///
    /// One Tesla is equal equal to one weber per square meter. It is named
    /// after the Serbian-born American electrical engineer and physicist
    /// Nikola Tesla (1856-1943).
    static const AlternateUnit tesla = SI.tesla;

    /// A unit of magnetic flux density equal `1000 A/m`
    /// (standard name `G`).
    static const Unit gauss = NonSI.gauss;

}

/// The measure of the quantity of matter that a body or an object contains.
///
/// The mass of the body is not dependent on gravity and therefore is different
/// from but proportional to its weight.
///
/// The system unit for this quantity is "kg" (kilogram).
class Mass extends Quantity {

    const Mass._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.kilogram;

    /// The base unit for mass quantities (`kg`).
    ///
    /// It is the only SI unit with a prefix as part of its name and symbol.
    /// The kilogram is equal to the mass of an international prototype in the
    /// form of a platinum-iridium cylinder kept at Sevres in France.
    static const BaseUnit kilogram = SI.kilogram;

    /// The derived unit for mass quantities (`g`).
    ///
    /// The base unit for mass quantity is [kilogram].
    static const Unit gram = SI.gram;

    /// A unit of mass equal to 1/12 the mass of the carbon-12 atom
    /// (standard name `u`).
    static const Unit atomicMass = NonSI.atomicMass;

    /// A unit of mass equal to the mass of the electron (standard name `me`).
    static const Unit electronMass = NonSI.electronMass;

    /// A unit of mass equal to `453.59237 grams` (avoirdupois pound,
    /// standard name `lb`).
    static const Unit pound = NonSI.pound;

    /// A unit of mass equal to `1 / 16 [POUND]` (standard name `oz`).
    static const Unit ounce = NonSI.ounce;

    /// A unit of mass equal to `2000 [POUND]` (short ton, standard name `ton_us`).
    static const Unit tonUS = NonSI.tonUS;

    /// A unit of mass equal to `2240 [POUND]` (long ton, standard name `ton_uk`).
    static const Unit tonUK = NonSI.tonUK;

    /// A unit of mass equal to `1000 kg` (metric ton, standard name `t`).
    static const Unit metricTon = NonSI.metricTon;

}

/// The movement of mass per time.
///
/// The system unit for this quantity is "kg/s" (kilogram per second).
class MassFlowRate extends Quantity {

    const MassFlowRate._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = const ProductUnit._(
        const [
            const RationalPower(SI.kilogram),
            const RationalPower(SI.second,const RationalNumber._(-1))
        ]
    );
}

/// The rate at which work is done.
///
/// The system unit for this quantity is "W" (Watt).
class Power extends Quantity {

    const Power._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.watt;

    /// The derived unit for power, radiant, flux (`W`).
    ///
    /// One watt is equal to one joule per second. It is named after the British
    /// scientist James Watt (1736-1819).
    static const AlternateUnit watt = SI.watt;

    /// A unit of power equal to the power required to raise a mass of 75
    /// kilograms at a velocity of 1 meter per second (metric,
    /// standard name `hp`).
    static const Unit horsepower = NonSI.horsepower;

}

/// A force applied uniformly over a surface.
///
/// The system unit for this quantity is "Pa" (Pascal).
class Pressure extends Quantity {

    const Pressure._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.pascal;

    /// The derived unit for pressure, stress (`Pa`).
    ///
    /// One pascal is equal to one newton per square meter. It is named after
    /// the French philosopher and mathematician Blaise Pascal (1623-1662).
    static const AlternateUnit pascal = SI.pascal;

    /// A unit of pressure equal to the average pressure of the Earth's
    /// atmosphere at sea level (standard name `atm`).
    static const Unit atmosphere = NonSI.atmosphere;

    /// A unit of pressure equal to `100 kPa`
    /// (standard name `bar`).
    static const Unit bar = NonSI.bar;

    /// A unit of pressure equal to the pressure exerted at the Earth's
    /// surface by a column of mercury 1 millimeter high
    /// (standard name `mmHg`).
    static const Unit millimeterOfMercury = NonSI.millimeterOfMercury;

    /// A unit of pressure equal to the pressure exerted at the Earth's
    /// surface by a column of mercury 1 inch high
    /// (standard name `inHg`).
    static const Unit inchOfMercury = NonSI.inchOfMercury;

}

/// The amount of energy deposited per unit of mass.
///
/// The system unit for this quantity is "Gy" (Gray).
class RadiationDoseAbsorbed extends Quantity {

    const RadiationDoseAbsorbed._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.gray;

    /// The derived unit for absorbed dose, specific energy (imparted), kerma
    /// (`Gy`).
    ///
    /// One gray is equal to the dose of one joule of energy absorbed per one
    /// kilogram of matter. It is named after the British physician
    /// L. H. Gray (1905-1965).
    static const AlternateUnit gray = SI.gray;

    /// A unit of radiation dose absorbed equal to a dose of 0.01 joule of
    /// energy per kilogram of mass (J/kg) (standard name `rd`).
    static const Unit rad = NonSI.rad;

    /// A unit of radiation dose effective equal to `0.01 Sv`
    /// (standard name `rem`).
    static const Unit rem = NonSI.rem;

}

/// The effective (or "equivalent") dose of radiation received by a human or
/// some other living organism.
///
/// The system unit for this quantity is "Sv" (Sievert).
class RadiationDoseEffective extends Quantity {

    const RadiationDoseEffective._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.sievert;

    /// The derived unit for dose equivalent (`Sv`).
    ///
    /// One Sievert is equal  is equal to the actual dose, in grays, multiplied
    /// by a "quality factor" which is larger for more dangerous forms of
    /// radiation. It is named after the Swedish physicist Rolf Sievert
    /// (1898-1966).
    static const AlternateUnit sievert = SI.sievert;
}

/// A radioactive activity.
///
/// The system unit for this quantity is "Bq" (Becquerel).
class RadioactiveActivity extends Quantity {

    const RadioactiveActivity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.becquerel;

    /// The derived unit for activity of a radionuclide (`Bq`).
    ///
    /// One becquerel is the radiation caused by one disintegration per second.
    /// It is named after the French physicist, Antoine-Henri Becquerel
    /// (1852-1908).
    static const AlternateUnit becquerel = SI.becquerel;

    /// A unit of radioctive activity equal to the activity of a gram of radium
    /// (standard name `Ci`).
    static const Unit curie = NonSI.curie;

    /// A unit of radioctive activity equal to 1 million radioactive
    /// disintegrations per second (standard name `Rd`).
    static const Unit rutherford = NonSI.rutherford;


}


/// The angle formed by three or more planes intersecting at a common point.
///
/// The system unit for this quantity is "sr" (steradian).
class SolidAngle extends Dimensionless {

    const SolidAngle._() : super._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.steradian;

    /// The unit for solid angle quantities (`sr`).
    ///
    /// One steradian is the solid angle subtended at the center of a sphere by
    /// an area on the surface of the sphere that is equal to the radius squared.
    /// The total solid angle of a sphere is 4*Pi steradians.
    static const AlternateUnit steradian = SI.steradian;

    /// A unit of solid angle equal to `4 <i>&pi;</i> steradians`
    /// (standard name `sphere`).
    static const Unit sphere = NonSI.sphere;

}

/// The degree of hotness or coldness of a body or an environment.
///
/// The system unit for this quantity is "K" (Kelvin).
class Temperature extends Quantity {

    const Temperature._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.kelvin;

    /// The derived unit for Celsius temperature (`℃`).
    ///
    /// This is a unit of temperature such as the freezing point of water
    /// (at one atmosphere of pressure) is 0 ℃, while the boiling point is
    /// 100 ℃.
    static const Unit celsius = SI.celsius;

    /// The base unit for thermodynamic temperature quantities (`K`).
    ///
    /// The kelvin is the 1/273.16th of the thermodynamic temperature of the
    /// triple point of water. It is named after the Scottish mathematician and
    /// physicist William Thomson 1st Lord Kelvin (1824-1907)
    static const BaseUnit kelvin = SI.kelvin;

    /// A unit of temperature equal to `5/9 °K` (standard name `°R`).
    static const Unit rankine = NonSI.rankine;

    /// A unit of temperature equal to degree Rankine minus `459.67 °R`
    /// (standard name `°F`).
    static const Unit fahrenheit = NonSI.fahrenheit;

}

/// The moment of a force.
///
/// The system unit for this quantity is "N·m" (Newton-Meter).
///
/// Note: The Newton-metre ("N·m") is also a way of exressing a Joule (unit of
/// energy). However, torque is not energy. So, to avoid confusion, we will use
/// the units "N·m" for torque and not "J". This distinction occurs due to the
/// scalar nature of energy and the vector nature of torque.
class Torque extends Quantity {

    const Torque._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit =
        const ProductUnit._(const [
            const RationalPower<Unit>(SI.newton),
            const RationalPower<Unit>(SI.metre)
        ]);

}


/// A distance traveled divided by the time of travel.
///
/// The system unit for this quantity is "m/s" (meter per second).
class Velocity extends Quantity {

    const Velocity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.metresPerSecond;

    /// The metric unit for velocity quantities (`m/s`).
    static const Unit metresPerSecond = SI.metresPerSecond;

    /// Equivalent to [metresPerSecond] (American spelling).
    static const Unit metersPerSecond = metresPerSecond;

    /// A unit of velocity expressing the number of international
    /// [mile] per [hour] (abbreviation `mph`).
    static const Unit milesPerHour = NonSI.milesPerHour;

    /// A unit of velocity expressing the number of [SI.kilometre] per [hour].
    static const Unit kilometresPerHour = NonSI.kilometresPerHour;

    /// Equivalent to [kilometresPerHour].
    static const Unit kilometersPerHour = kilometresPerHour;

    /// A unit of velocity expressing the number of [nauticalMile] per [hour]
    /// (abbreviation `kn`).
    static const Unit knot = NonSI.knot;

    /// A unit of velocity to express the speed of an aircraft relative to
    /// the speed of sound (standard name `Mach`).
    static const Unit mach = NonSI.mach;

    /// A unit of velocity relative to the speed of light
    /// (standard name `c`).
    static const Unit c = NonSI.c;

}

/// The amount of space occupied by a three-dimensional object or region of
/// space, expressed in cubic units.
///
/// The system unit for this quantity is "m³" (cubic meter).
class Volume extends Quantity {

    const Volume._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit = SI.cubicMetre;

    /// The metric unit for volume quantities (`m³`).
    static const Unit cubicMetre = SI.cubicMetre;

    /// A unit of volume equal to one cubic decimeter (default label
    /// `L`, also recognized `µL, mL, cL, dL`).
    static const Unit litre = const TransformedUnit(SI.cubicMetre,SI.Em3);

    /// Equivalent to [litre] (American spelling).
    static const Unit liter = litre;

    /// A unit of volume equal to one cubic inch (`in³`).
    static const Unit cubicInch = NonSI.cubicInch;

    /// A unit of volume equal to one US gallon, Liquid Unit. The U.S. liquid
    /// gallon is based on the Queen Anne or Wine gallon occupying 231 cubic
    /// inches (standard name `gal`).
    static const Unit gallonLiquidUS = NonSI.gallonLiquidUS;

    /// A unit of volume equal to `1 / 128 [GALLON_LIQUID_US]`
    /// (standard name `oz_fl`).
    static const Unit ounceLiquidUS = NonSI.ounceLiquidUS;

    /// A unit of volume equal to one US dry gallon.
    /// (standard name `gallon_dry_us`).
    static const Unit gallonDryUS = NonSI.gallonDryUS;

    /// A unit of volume equal to `4.546 09 [LITRE]`
    /// (standard name `gal_uk`).
    static const Unit gallonUK = NonSI.gallonUK;

    /// A unit of volume equal to `1 / 160 [GALLON_UK]`
    /// (standard name `oz_fl_uk`).
    static const Unit ounceLiquidUK = NonSI.ounceLiquidUK;


}

/// A mass per unit volume of a substance under specified conditions of pressure
/// and temperature.
///
/// The system unit for this quantity is "kg/m³" (kilogram per cubic meter).
class VolumetricDensity extends Quantity {

    const VolumetricDensity._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit =
    const ProductUnit._(const [
        const RationalPower(SI.kilogram),
        const RationalPower(SI.metre,const RationalNumber._(-3))
    ]);
}

/// The volume of fluid passing a point in a system per unit of time.
///
/// The system unit for this quantity is "m³/s" (cubic meter per second).
class VolumetricFlowRate extends Quantity {

    const VolumetricFlowRate._();

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit siUnit =
    const ProductUnit._(const [
        const RationalPower(SI.metre,const RationalNumber._(3)),
        const RationalPower(SI.second,const RationalNumber._(-1))
    ]);
}


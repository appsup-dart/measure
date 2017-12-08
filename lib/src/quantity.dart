
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
    static const Unit<Dimensionless> siUnit = Unit.one;

    /// A dimensionless unit equals to `0.01` (standard name `%`).
    static const Unit<Dimensionless> percent = NonSI.percent;

    /// A logarithmic unit used to describe a ratio (standard name `dB`).
    static const Unit<Dimensionless> decibel = NonSI.decibel;

}

/// The rate of change of velocity with respect to time.
///
/// The system unit for this quantity is "m/s²" (meter per square second).
abstract class Acceleration extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Acceleration> siUnit = SI.metresPerSquareSecond;

    /// The metric unit for acceleration quantities (`m/s²`).
    static const Unit<Acceleration> metresPerSquareSecond = SI.metresPerSquareSecond;

    /// Equivalent to [metresPerSquareSecond] (American spelling).
    static const Unit<Acceleration> metersPerSquareSecond = metresPerSquareSecond;

    /// A unit of acceleration equal to the gravity at the earth's surface
    /// (standard name `grav`).
    static const Unit<Acceleration> g = NonSI.g;
}


/// The number of elementary entities (molecules, for example) of a substance.
///
/// The system unit for this quantity is "mol" (mole).
abstract class AmountOfSubstance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<AmountOfSubstance> siUnit = SI.mole;

    /// The base unit for amount of substance quantities (`mol`).
    ///
    /// The mole is the amount of substance of a system which contains as many
    /// elementary entities as there are atoms in 0.012 kilogram of carbon 12.
    static const BaseUnit<AmountOfSubstance> mole = SI.mole;

    /// A unit of amount of substance equals to one atom (standard name `atom`).
    static const Unit<AmountOfSubstance> atom =  NonSI.atom;

}

/// The figure formed by two lines diverging from a common point.
///
/// The system unit for this quantity is "rad" (radian). This quantity is
/// dimensionless.
abstract class Angle extends Dimensionless {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Angle> siUnit = SI.radian;

    /// The unit for plane angle quantities (`rad`).
    ///
    /// One radian is the angle between two radii of a circle such that the
    /// length of the arc between them is equal to the radius.
    static const AlternateUnit<Angle> radian = SI.radian;

    /// A unit of angle equal to a full circle or `2<i>&pi;</i> [SI.RADIAN]`
    /// (standard name `rev`).
    static const Unit<Angle> revolution = NonSI.revolution;

    /// A unit of angle equal to `1/360 [REVOLUTION]` (standard name `°`).
    static const Unit<Angle> degreeAngle = NonSI.degreeAngle;

    /// A unit of angle equal to `1/60 [DEGREE_ANGLE]` (standard name `′`).
    static const Unit<Angle> minuteAngle = NonSI.minuteAngle;

    /// A unit of angle equal to `1/60 [MINUTE_ANGLE]` (standard name `"`).
    static const Unit<Angle> secondAngle = NonSI.secondAngle;

    /// A unit of angle equal to `0.01 [SI.RADIAN]` (standard name `centiradian`).
    static const Unit<Angle> centiradian = NonSI.centiradian;

    /// A unit of angle measure equal to `1/400 [REVOLUTION]`
    /// (standard name `grade`).
    static const Unit<Angle> grade = NonSI.grade;

}

/// The rate of change of angular velocity with respect to time.
///
/// The system unit for this quantity is "rad/s²" (radian per square second).
abstract class AngularAcceleration extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<AngularAcceleration> siUnit =
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
    static const Unit<AngularVelocity> siUnit =
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
    static const Unit<Area> siUnit = SI.squareMetre;

    /// The metric unit for area quantities (`m²`).
    static const Unit<Area> squareMetre = SI.squareMetre;

    /// A unit of area equal to `100 m²`
    /// (standard name `a`).
    static const Unit<Area> are = NonSI.are;

    /// A unit of area equal to `100 [ARE]`
    /// (standard name `ha`).
    static const Unit<Area> hectare = NonSI.hectare;

}

/// A catalytic activity.
///
/// The system unit for this quantity is "kat" (katal).
abstract class CatalyticActivity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<CatalyticActivity> siUnit = SI.katal;

    /// The derived unit for catalytic activity (`kat`).
    static const AlternateUnit<CatalyticActivity> katal = SI.katal;
}

/// A measure of data amount.
///
/// The system unit for this quantity is "bit". This quantity is dimensionless.
abstract class DataAmount extends Dimensionless {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<DataAmount> siUnit = SI.bit;

    /// The unit for binary information (`bit`).
    static const AlternateUnit<DataAmount> bit = SI.bit;

    /// A unit of data amount equal to `8 [SI.BIT]`
    /// (BinarY TErm, standard name `byte`).
    static const Unit<DataAmount> byte = NonSI.byte;

    /// Equivalent [byte]
    static const Unit<DataAmount> octet = byte;

}

/// The speed of data-transmission.
///
/// The system unit for this quantity is "bit/s" (bit per second).
abstract class DataRate extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<DataRate> siUnit = const ProductUnit<DataRate>._(
        const [
            const _RationalPower<Unit>(SI.bit),
            const _RationalPower<Unit>(SI.second,const RationalNumber._(-1))
        ]);

}

/// A period of existence or persistence.
///
/// The system unit for this quantity is "s" (second).
abstract class DurationQuantity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<DurationQuantity> siUnit = SI.second;

    /// The base unit for duration quantities (`s`).
    ///
    /// It is defined as the duration of 9,192,631,770 cycles of radiation
    /// corresponding to the transition between two hyperfine levels of
    /// the ground state of cesium (1967 Standard).
    static const BaseUnit<DurationQuantity> second = SI.second;

    /// A unit of duration equal to `60 s` (standard name `min`).
    static const Unit<DurationQuantity> minute = NonSI.minute;

    /// A unit of duration equal to `60 [MINUTE]` (standard name `h`).
    static const Unit<DurationQuantity> hour = NonSI.hour;

    /// A unit of duration equal to `24 [HOUR]` (standard name `d`).
    static const Unit<DurationQuantity> day = NonSI.day;

    /// A unit of duration equal to `7 [DAY]` (standard name `week`).
    static const Unit<DurationQuantity> week = NonSI.week;

    /// A unit of duration equal to 365 days, 5 hours, 49 minutes,
    /// and 12 seconds (standard name `year`).
    static const Unit<DurationQuantity> year = NonSI.year;

    /// A unit of duration equal to one twelfth of a year (standard name `month`).
    static const Unit<DurationQuantity> month = NonSI.month;

    /// A unit of duration equal to the time required for a complete rotation of
    /// the earth in reference to any star or to the vernal equinox at the
    /// meridian, equal to 23 hours, 56 minutes, 4.09 seconds
    /// (standard name `day_sidereal`).
    static const Unit<DurationQuantity> daySidereal = NonSI.daySidereal;

    /// A unit of duration equal to one complete revolution of the
    /// earth about the sun, relative to the fixed stars, or 365 days, 6 hours,
    /// 9 minutes, 9.54 seconds (standard name `year_sidereal`).
    static const Unit<DurationQuantity> yearSidereal = NonSI.yearSidereal;

    /// A unit of duration equal to `365 [DAY]` (standard name `year_calendar`).
    static const Unit<DurationQuantity> yearCalendar = NonSI.yearCalendar;

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

    /// A unit of dynamic viscosity equal to `1 g/(cm·s)` (cgs unit).
    static const Unit<DynamicViscosity> poise = NonSI.poise;

}

/// An electric capacitance.
///
/// The system unit for this quantity is "F" (Farad).
abstract class ElectricCapacitance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricCapacitance> siUnit = SI.farad;

    /// The derived unit for capacitance (`F`).
    ///
    /// One Farad is equal to the capacitance of a capacitor having an equal
    /// and opposite charge of 1 coulomb on each plate and a potential difference
    /// of 1 volt between the plates. It is named after the British physicist
    /// and chemist Michael Faraday (1791-1867).
    static const AlternateUnit<ElectricCapacitance> farad = SI.farad;
}

/// An electric charge.
///
/// The system unit for this quantity is "C" (Coulomb).
abstract class ElectricCharge extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricCharge> siUnit = SI.coulomb;

    /// The derived unit for electric charge, quantity of electricity
    /// (`C`).
    ///
    /// One Coulomb is equal to the quantity of charge transferred in one second
    /// by a steady current of one ampere. It is named after the French physicist
    /// Charles Augustin de Coulomb (1736-1806).
    static const AlternateUnit<ElectricCharge> coulomb = SI.coulomb;

    /// A unit of electric charge equal to the charge on one electron
    /// (standard name `e`).
    static const Unit<ElectricCharge> e = NonSI.e;

    /// A unit of electric charge equal to equal to the product of Avogadro's
    /// number (see [mole]) and the charge (1 e) on a single electron
    /// (standard name `Fd`).
    static const Unit<ElectricCharge> faraday = NonSI.faraday;

    /// A unit of electric charge which exerts a force of one dyne on an equal
    /// charge at a distance of one centimeter (standard name `Fr`).
    static const Unit<ElectricCharge> franklin = NonSI.franklin;


}


/// An electric conductance.
///
/// The system unit for this quantity "S" (Siemens).
abstract class ElectricConductance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricConductance> siUnit = SI.siemens;

    /// The derived unit for electric conductance (`S`).
    ///
    /// One Siemens is equal to one ampere per volt. It is named after
    /// the German engineer Ernst Werner von Siemens (1816-1892).
    static const AlternateUnit<ElectricConductance> siemens = SI.siemens;

}

/// The amount of electric charge flowing past a specified circuit point per
/// unit time.
///
/// The system unit for this quantity is "A" (Ampere).
abstract class ElectricCurrent extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricCurrent> siUnit = SI.ampere;

    /// The base unit for electric current quantities (`A`).
    ///
    /// The Ampere is that constant current which, if maintained in two straight
    /// parallel conductors of infinite length, of negligible circular
    /// cross-section, and placed 1 metre apart in vacuum, would produce between
    /// these conductors a force equal to 2 × 10-7 newton per metre of length.
    ///
    /// It is named after the French physicist Andre Ampere (1775-1836).
    static const BaseUnit<ElectricCurrent> ampere = SI.ampere;

    /// A unit of electric charge equal to the centimeter-gram-second
    /// electromagnetic unit of magnetomotive force, equal to `10/4
    /// &pi;ampere-turn` (standard name `Gi`).
    static const Unit<ElectricCurrent> gilbert = NonSI.gilbert;

}

/// An electric inductance.
///
/// The system unit for this quantity is "H" (Henry).
abstract class ElectricInductance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricInductance> siUnit = SI.henry;

    /// The derived unit for inductance (`H`).
    ///
    /// One Henry is equal to the inductance for which an induced electromotive
    /// force of one volt is produced when the current is varied at the rate of
    /// one ampere per second. It is named after the American physicist
    /// Joseph Henry (1791-1878).
    static const AlternateUnit<ElectricInductance> henry = SI.henry;
}

/// An electric potential or electromotive force.
///
/// The system unit for this quantity is "V" (Volt).
abstract class ElectricPotential extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricPotential> siUnit = SI.volt;

    /// The derived unit for electric potential difference, electromotive force
    /// (`V`).
    ///
    /// One Volt is equal to the difference of electric potential between two
    /// points on a conducting wire carrying a constant current of one ampere
    /// when the power dissipated between the points is one watt. It is named
    /// after the Italian physicist Count Alessandro Volta (1745-1827).
    static const AlternateUnit<ElectricPotential> volt = SI.volt;

}

/// An electric resistance.
///
/// The system unit for this quantity is "Ω" (Ohm).
abstract class ElectricResistance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<ElectricResistance> siUnit = SI.ohm;

    /// The derived unit for electric resistance (`Ω` or `Ohm`).
    ///
    /// One Ohm is equal to the resistance of a conductor in which a current of
    /// one ampere is produced by a potential of one volt across its terminals.
    /// It is named after the German physicist Georg Simon Ohm (1789-1854).
    static const AlternateUnit<ElectricResistance> ohm = SI.ohm;

}

/// The capacity of a physical system to do work.
///
/// The system unit for this quantity "J" (Joule).
abstract class Energy extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Energy> siUnit = SI.joule;

    /// The derived unit for energy, work, quantity of heat (`J`).
    ///
    /// One joule is the amount of work done when an applied force of 1 newton
    /// moves through a distance of 1 metre in the direction of the force.
    /// It is named after the English physicist James Prescott Joule (1818-1889).
    static const AlternateUnit<Energy> joule = SI.joule;

    /// A unit of energy equal to `1E-7 J`
    /// (standard name `erg`).
    static const Unit<Energy> erg = NonSI.erg;

    /// A unit of energy equal to one electron-volt (standard name
    /// `eV`, also recognized `keV, MeV, GeV`).
    static const Unit<Energy> electronVolt = NonSI.electronVolt;

}

/// A quantity that tends to produce an acceleration of a body in the direction
/// of its application.
///
/// The system unit for this quantity is "N" (Newton).
abstract class Force extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Force> siUnit = SI.newton;

    /// The derived unit for force (`N`).
    ///
    /// One newton is the force required to give a mass of 1 kilogram an Force
    /// of 1 metre per second per second. It is named after the English
    /// mathematician and physicist Sir Isaac Newton (1642-1727).
    static const AlternateUnit<Force> newton = SI.newton;

    /// A unit of force equal to `1E-5 N`
    /// (standard name `dyn`).
    static const Unit<Force> dyne = NonSI.dyne;

    /// A unit of force equal to `9.80665 N`
    /// (standard name `kgf`).
    static const Unit<Force> kilogramForce = NonSI.kilogramForce;

    /// A unit of force equal to `[POUND]·[G]`
    /// (standard name `lbf`).
    static const Unit<Force> poundForce = NonSI.poundForce;

}

/// The number of times a specified phenomenon occurs within a specified
/// interval.
///
/// The system unit for this quantity is "Hz" (Hertz).
abstract class Frequency extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Frequency> siUnit = SI.hertz;

    /// The derived unit for frequency (`Hz`).
    ///
    /// A unit of frequency equal to one cycle per second.
    /// After Heinrich Rudolf Hertz (1857-1894), German physicist who was the
    /// first to produce radio waves artificially.
    static const AlternateUnit<Frequency> hertz = SI.hertz;

}

/// An illuminance.
///
/// The system unit for this quantity is "lx" (lux).
abstract class Illuminance extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Illuminance> siUnit = SI.lux;

    /// The derived unit for illuminance (`lx`).
    ///
    /// One Lux is equal to one lumen per square meter.
    static const AlternateUnit<Illuminance> lux = SI.lux;

    /// A unit of illuminance equal to `1E4 Lx`
    /// (standard name `La`).
    static const Unit<Illuminance> lambert = NonSI.lambert;

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

    /// A unit of kinematic viscosity equal to `1 cm²/s` (cgs unit).
    static const Unit<KinematicViscosity> stoke = NonSI.stoke;

}

/// The extent of something along its greatest dimension or the extent of space
/// between two objects or places.
///
/// The system unit for this quantity is "m" (meter).
abstract class Length extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Length> siUnit = SI.metre;

    /// Equivalent to `KILO(METRE)`.
    static const Unit<Length> kilometre = SI.kilometre;

    /// Equivalent to [kilometre] (American spelling).
    static const Unit<Length> kilometer = kilometre;

    /// Equivalent to `CENTI(METRE)`.
    static const Unit<Length> centimetre = SI.centimetre;

    /// Equivalent to [centimetre] (American spelling).
    static const Unit<Length> centimeter = centimetre;

    /// Equivalent to `MILLI(METRE)`.
    static const Unit<Length> millimetre = SI.millimetre;

    /// Equivalent to [millimetre] (American spelling).
    static const Unit<Length> millimeter = millimetre;

    /// The base unit for length quantities (`m`).
    ///
    /// One meter was redefined in 1983 as the distance traveled by light in
    /// a vacuum in 1/299,792,458 of a second.
    static const BaseUnit<Length> metre = SI.metre;

    /// Equivalent to [metre] (American spelling).
    static const Unit<Length> meter = metre;

    /// A unit of length equal to `0.3048 m` (standard name `ft`).
    static const Unit<Length> foot = NonSI.foot;

    /// A unit of length equal to `1200/3937 m` (standard name `foot_survey_us`).
    static const Unit<Length> footSurveyUS = NonSI.footSurveyUS;

    /// A unit of length equal to `0.9144 m` (standard name `yd`).
    static const Unit<Length> yard = NonSI.yard;

    /// A unit of length equal to `0.0254 m` (standard name `in`).
    static const Unit<Length> inch = NonSI.inch;

    /// A unit of length equal to `1609.344 m` (standard name `mi`).
    static const Unit<Length> mile = NonSI.mile;

    /// A unit of length equal to `1852.0 m` (standard name `nmi`).
    static const Unit<Length> nauticalMile = NonSI.nauticalMile;

    /// A unit of length equal to `1E-10 m` (standard name `Å`).
    static const Unit<Length> angstrom = NonSI.angstrom;

    /// A unit of length equal to the average distance from the center of the
    /// Earth to the center of the Sun (standard name `ua`).
    static const Unit<Length> astronomicalUnit = NonSI.astronomicalUnit;

    /// A unit of length equal to the distance that light travels in one year
    /// through a vacuum (standard name `ly`).
    static const Unit<Length> lightYear = NonSI.lightYear;

    /// A unit of length equal to the distance at which a star would appear to
    /// shift its position by one arcsecond over the course the time
    /// (about 3 months) in which the Earth moves a distance of
    /// [astronomicalUnit] in the direction perpendicular to the
    /// direction to the star (standard name `pc`).
    static const Unit<Length> parsec = NonSI.parsec;

    /// A unit of length equal to `0.013837 [INCH]` exactly (standard name `pt`).
    static const Unit<Length> point = NonSI.point;

    /// A unit of length equal to `1/72 [INCH]` (standard name `pixel`).
    ///
    /// It is the American point rounded to an even 1/72 inch.
    static const Unit<Length> pixel = NonSI.pixel;

    /// Equivalent [pixel]
    static const Unit<Length> computerPoint = pixel;

}

/// A luminous flux.
///
/// The system unit for this quantity is "lm" (lumen).
abstract class LuminousFlux extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<LuminousFlux> siUnit = SI.lumen;

    /// The derived unit for luminous flux (`lm`).
    ///
    /// One Lumen is equal to the amount of light given out through a solid angle
    /// by a source of one candela intensity radiating equally in all directions.
    static const AlternateUnit<LuminousFlux> lumen = SI.lumen;
}

/// The luminous flux density per solid angle as measured in a given direction
/// relative to the emitting source.
///
/// The system unit for this quantity is "cd" (candela).
abstract class LuminousIntensity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<LuminousIntensity> siUnit = SI.candela;

    /// The base unit for luminous intensity quantities (`cd`).
    ///
    /// The candela is the luminous intensity, in a given direction,
    /// of a source that emits monochromatic radiation of frequency
    /// 540 × 1012 hertz and that has a radiant intensity in that
    /// direction of 1/683 watt per steradian.
    static const BaseUnit<LuminousIntensity> candela = SI.candela;

}

/// A magnetic flux.
///
/// The system unit for this quantity is "Wb" (Weber).
abstract class MagneticFlux extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<MagneticFlux> siUnit = SI.weber;

    /// The derived unit for magnetic flux (`Wb`).
    ///
    /// One Weber is equal to the magnetic flux that in linking a circuit of one
    /// turn produces in it an electromotive force of one volt as it is uniformly
    /// reduced to zero within one second. It is named after the German physicist
    /// Wilhelm Eduard Weber (1804-1891).
    static const AlternateUnit<MagneticFlux> weber = SI.weber;

    /// A unit of magnetic flux equal `1E-8 Wb`
    /// (standard name `Mx`).
    static const Unit<MagneticFlux> maxwell = NonSI.maxwell;

}

/// A magnetic flux density.
///
/// The system unit for this quantity is "T" (Tesla).
abstract class MagneticFluxDensity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<MagneticFluxDensity> siUnit = SI.tesla;

    /// The derived unit for magnetic flux density (`T`).
    ///
    /// One Tesla is equal equal to one weber per square meter. It is named
    /// after the Serbian-born American electrical engineer and physicist
    /// Nikola Tesla (1856-1943).
    static const AlternateUnit<MagneticFluxDensity> tesla = SI.tesla;

    /// A unit of magnetic flux density equal `1000 A/m`
    /// (standard name `G`).
    static const Unit<MagneticFluxDensity> gauss = NonSI.gauss;

}

/// The measure of the quantity of matter that a body or an object contains.
///
/// The mass of the body is not dependent on gravity and therefore is different
/// from but proportional to its weight.
///
/// The system unit for this quantity is "kg" (kilogram).
abstract class Mass extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Mass> siUnit = SI.kilogram;

    /// The base unit for mass quantities (`kg`).
    ///
    /// It is the only SI unit with a prefix as part of its name and symbol.
    /// The kilogram is equal to the mass of an international prototype in the
    /// form of a platinum-iridium cylinder kept at Sevres in France.
    static const BaseUnit<Mass> kilogram = SI.kilogram;

    /// The derived unit for mass quantities (`g`).
    ///
    /// The base unit for mass quantity is [kilogram].
    static const Unit<Mass> gram = SI.gram;

    /// A unit of mass equal to 1/12 the mass of the carbon-12 atom
    /// (standard name `u`).
    static const Unit<Mass> atomicMass = NonSI.atomicMass;

    /// A unit of mass equal to the mass of the electron (standard name `me`).
    static const Unit<Mass> electronMass = NonSI.electronMass;

    /// A unit of mass equal to `453.59237 grams` (avoirdupois pound,
    /// standard name `lb`).
    static const Unit<Mass> pound = NonSI.pound;

    /// A unit of mass equal to `1 / 16 [POUND]` (standard name `oz`).
    static const Unit<Mass> ounce = NonSI.ounce;

    /// A unit of mass equal to `2000 [POUND]` (short ton, standard name `ton_us`).
    static const Unit<Mass> tonUS = NonSI.tonUS;

    /// A unit of mass equal to `2240 [POUND]` (long ton, standard name `ton_uk`).
    static const Unit<Mass> tonUK = NonSI.tonUK;

    /// A unit of mass equal to `1000 kg` (metric ton, standard name `t`).
    static const Unit<Mass> metricTon = NonSI.metricTon;

}

/// The movement of mass per time.
///
/// The system unit for this quantity is "kg/s" (kilogram per second).
abstract class MassFlowRate extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<MassFlowRate> siUnit = const ProductUnit<MassFlowRate>._(
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
    static const Unit<Power> siUnit = SI.watt;

    /// The derived unit for power, radiant, flux (`W`).
    ///
    /// One watt is equal to one joule per second. It is named after the British
    /// scientist James Watt (1736-1819).
    static const AlternateUnit<Power> watt = SI.watt;

    /// A unit of power equal to the power required to raise a mass of 75
    /// kilograms at a velocity of 1 meter per second (metric,
    /// standard name `hp`).
    static const Unit<Power> horsepower = NonSI.horsepower;

}

/// A force applied uniformly over a surface.
///
/// The system unit for this quantity is "Pa" (Pascal).
abstract class Pressure extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Pressure> siUnit = SI.pascal;

    /// The derived unit for pressure, stress (`Pa`).
    ///
    /// One pascal is equal to one newton per square meter. It is named after
    /// the French philosopher and mathematician Blaise Pascal (1623-1662).
    static const AlternateUnit<Pressure> pascal = SI.pascal;

    /// A unit of pressure equal to the average pressure of the Earth's
    /// atmosphere at sea level (standard name `atm`).
    static const Unit<Pressure> atmosphere = NonSI.atmosphere;

    /// A unit of pressure equal to `100 kPa`
    /// (standard name `bar`).
    static const Unit<Pressure> bar = NonSI.bar;

    /// A unit of pressure equal to the pressure exerted at the Earth's
    /// surface by a column of mercury 1 millimeter high
    /// (standard name `mmHg`).
    static const Unit<Pressure> millimeterOfMercury = NonSI.millimeterOfMercury;

    /// A unit of pressure equal to the pressure exerted at the Earth's
    /// surface by a column of mercury 1 inch high
    /// (standard name `inHg`).
    static const Unit<Pressure> inchOfMercury = NonSI.inchOfMercury;

}

/// The amount of energy deposited per unit of mass.
///
/// The system unit for this quantity is "Gy" (Gray).
abstract class RadiationDoseAbsorbed extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<RadiationDoseAbsorbed> siUnit = SI.gray;

    /// The derived unit for absorbed dose, specific energy (imparted), kerma
    /// (`Gy`).
    ///
    /// One gray is equal to the dose of one joule of energy absorbed per one
    /// kilogram of matter. It is named after the British physician
    /// L. H. Gray (1905-1965).
    static const AlternateUnit<RadiationDoseAbsorbed> gray = SI.gray;

    /// A unit of radiation dose absorbed equal to a dose of 0.01 joule of
    /// energy per kilogram of mass (J/kg) (standard name `rd`).
    static const Unit<RadiationDoseAbsorbed> rad = NonSI.rad;

    /// A unit of radiation dose effective equal to `0.01 Sv`
    /// (standard name `rem`).
    static const Unit<RadiationDoseEffective> rem = NonSI.rem;

}

/// The effective (or "equivalent") dose of radiation received by a human or
/// some other living organism.
///
/// The system unit for this quantity is "Sv" (Sievert).
abstract class RadiationDoseEffective extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<RadiationDoseEffective> siUnit = SI.sievert;

    /// The derived unit for dose equivalent (`Sv`).
    ///
    /// One Sievert is equal  is equal to the actual dose, in grays, multiplied
    /// by a "quality factor" which is larger for more dangerous forms of
    /// radiation. It is named after the Swedish physicist Rolf Sievert
    /// (1898-1966).
    static const AlternateUnit<RadiationDoseEffective> sievert = SI.sievert;
}

/// A radioactive activity.
///
/// The system unit for this quantity is "Bq" (Becquerel).
abstract class RadioactiveActivity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<RadioactiveActivity> siUnit = SI.becquerel;

    /// The derived unit for activity of a radionuclide (`Bq`).
    ///
    /// One becquerel is the radiation caused by one disintegration per second.
    /// It is named after the French physicist, Antoine-Henri Becquerel
    /// (1852-1908).
    static const AlternateUnit<RadioactiveActivity> becquerel = SI.becquerel;

    /// A unit of radioctive activity equal to the activity of a gram of radium
    /// (standard name `Ci`).
    static const Unit<RadioactiveActivity> curie = NonSI.curie;

    /// A unit of radioctive activity equal to 1 million radioactive
    /// disintegrations per second (standard name `Rd`).
    static const Unit<RadioactiveActivity> rutherford = NonSI.rutherford;


}


/// The angle formed by three or more planes intersecting at a common point.
///
/// The system unit for this quantity is "sr" (steradian).
abstract class SolidAngle extends Dimensionless {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<SolidAngle> siUnit = SI.steradian;

    /// The unit for solid angle quantities (`sr`).
    ///
    /// One steradian is the solid angle subtended at the center of a sphere by
    /// an area on the surface of the sphere that is equal to the radius squared.
    /// The total solid angle of a sphere is 4*Pi steradians.
    static const AlternateUnit<SolidAngle> steradian = SI.steradian;

    /// A unit of solid angle equal to `4 <i>&pi;</i> steradians`
    /// (standard name `sphere`).
    static const Unit<SolidAngle> sphere = NonSI.sphere;

}

/// The degree of hotness or coldness of a body or an environment.
///
/// The system unit for this quantity is "K" (Kelvin).
abstract class Temperature extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Temperature> siUnit = SI.kelvin;

    /// The derived unit for Celsius temperature (`℃`).
    ///
    /// This is a unit of temperature such as the freezing point of water
    /// (at one atmosphere of pressure) is 0 ℃, while the boiling point is
    /// 100 ℃.
    static const Unit<Temperature> celsius = SI.celsius;

    /// The base unit for thermodynamic temperature quantities (`K`).
    ///
    /// The kelvin is the 1/273.16th of the thermodynamic temperature of the
    /// triple point of water. It is named after the Scottish mathematician and
    /// physicist William Thomson 1st Lord Kelvin (1824-1907)
    static const BaseUnit<Temperature> kelvin = SI.kelvin;

    /// A unit of temperature equal to `5/9 °K` (standard name `°R`).
    static const Unit<Temperature> rankine = NonSI.rankine;

    /// A unit of temperature equal to degree Rankine minus `459.67 °R`
    /// (standard name `°F`).
    static const Unit<Temperature> fahrenheit = NonSI.fahrenheit;

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
    static const Unit<Torque> siUnit =
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
    static const Unit<Velocity> siUnit = SI.metresPerSecond;

    /// The metric unit for velocity quantities (`m/s`).
    static const Unit<Velocity> metresPerSecond = SI.metresPerSecond;

    /// Equivalent to [metresPerSecond] (American spelling).
    static const Unit<Velocity> metersPerSecond = metresPerSecond;

    /// A unit of velocity expressing the number of international
    /// [mile] per [hour] (abbreviation `mph`).
    static const Unit<Velocity> milesPerHour = NonSI.milesPerHour;

    /// A unit of velocity expressing the number of [SI.kilometre] per [hour].
    static const Unit<Velocity> kilometresPerHour = NonSI.kilometresPerHour;

    /// Equivalent to [kilometresPerHour].
    static const Unit<Velocity> kilometersPerHour = kilometresPerHour;

    /// A unit of velocity expressing the number of [nauticalMile] per [hour]
    /// (abbreviation `kn`).
    static const Unit<Velocity> knot = NonSI.knot;

    /// A unit of velocity to express the speed of an aircraft relative to
    /// the speed of sound (standard name `Mach`).
    static const Unit<Velocity> mach = NonSI.mach;

    /// A unit of velocity relative to the speed of light
    /// (standard name `c`).
    static const Unit<Velocity> c = NonSI.c;

}

/// The amount of space occupied by a three-dimensional object or region of
/// space, expressed in cubic units.
///
/// The system unit for this quantity is "m³" (cubic meter).
abstract class Volume extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<Volume> siUnit = SI.cubicMetre;

    /// The metric unit for volume quantities (`m³`).
    static const Unit<Volume> cubicMetre = SI.cubicMetre;

    /// A unit of volume equal to one cubic decimeter (default label
    /// `L`, also recognized `µL, mL, cL, dL`).
    static const Unit<Volume> litre = const TransformedUnit(SI.cubicMetre,SI.Em3);

    /// Equivalent to [litre] (American spelling).
    static const Unit<Volume> liter = litre;

    /// A unit of volume equal to one cubic inch (`in³`).
    static const Unit<Volume> cubicInch = NonSI.cubicInch;

    /// A unit of volume equal to one US gallon, Liquid Unit. The U.S. liquid
    /// gallon is based on the Queen Anne or Wine gallon occupying 231 cubic
    /// inches (standard name `gal`).
    static const Unit<Volume> gallonLiquidUS = NonSI.gallonLiquidUS;

    /// A unit of volume equal to `1 / 128 [GALLON_LIQUID_US]`
    /// (standard name `oz_fl`).
    static const Unit<Volume> ounceLiquidUS = NonSI.ounceLiquidUS;

    /// A unit of volume equal to one US dry gallon.
    /// (standard name `gallon_dry_us`).
    static const Unit<Volume> gallonDryUS = NonSI.gallonDryUS;

    /// A unit of volume equal to `4.546 09 [LITRE]`
    /// (standard name `gal_uk`).
    static const Unit<Volume> gallonUK = NonSI.gallonUK;

    /// A unit of volume equal to `1 / 160 [GALLON_UK]`
    /// (standard name `oz_fl_uk`).
    static const Unit<Volume> ounceLiquidUK = NonSI.ounceLiquidUK;


}

/// A mass per unit volume of a substance under specified conditions of pressure
/// and temperature.
///
/// The system unit for this quantity is "kg/m³" (kilogram per cubic meter).
abstract class VolumetricDensity extends Quantity {

    /// The SI unit (Système International d'Unités) for this quantity.
    static const Unit<VolumetricDensity> siUnit =
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
    static const Unit<VolumetricFlowRate> siUnit =
    const ProductUnit<VolumetricFlowRate>._(const [
        const _RationalPower(SI.metre,const RationalNumber._(3)),
        const _RationalPower(SI.second,const RationalNumber._(-1))
    ]);
}



part of measure;

/// A system of units.
///
/// It groups units together for historical or cultural reasons. Nothing
/// prevents a unit from belonging to several system of units at the same time
/// (for example an imperial system would have many of the units held by
/// [NonSI]).
abstract class SystemOfUnits {
    
    const SystemOfUnits();
    
    /// A read only view over the units defined in this system.
    List<Unit> get units;

}

/// Contains SI (Système International d'Unités) base units, and derived units.
///
/// It also defines the 20 SI prefixes used to form decimal multiples and
/// submultiples of SI units.
abstract class SI extends SystemOfUnits {

    const SI._();

    ////////////////
    // BASE UNITS //
    ////////////////

    /// The base unit for electric current quantities (`A`).
    ///
    /// The Ampere is that constant current which, if maintained in two straight
    /// parallel conductors of infinite length, of negligible circular
    /// cross-section, and placed 1 metre apart in vacuum, would produce between
    /// these conductors a force equal to 2 × 10-7 newton per metre of length.
    ///
    /// It is named after the French physicist Andre Ampere (1775-1836).
    static const BaseUnit<ElectricCurrent> AMPERE = const BaseUnit<ElectricCurrent>._("A");

    /// The base unit for luminous intensity quantities (`cd`).
    ///
    /// The candela is the luminous intensity, in a given direction,
    /// of a source that emits monochromatic radiation of frequency
    /// 540 × 1012 hertz and that has a radiant intensity in that
    /// direction of 1/683 watt per steradian.
    static const BaseUnit<LuminousIntensity> CANDELA = const BaseUnit<LuminousIntensity>._("cd");

    /// The base unit for thermodynamic temperature quantities (`K`).
    ///
    /// The kelvin is the 1/273.16th of the thermodynamic temperature of the
    /// triple point of water. It is named after the Scottish mathematician and
    /// physicist William Thomson 1st Lord Kelvin (1824-1907)
    static const BaseUnit<Temperature> KELVIN = const BaseUnit<Temperature>._("K");

    /// The base unit for mass quantities (`kg`).
    ///
    /// It is the only SI unit with a prefix as part of its name and symbol.
    /// The kilogram is equal to the mass of an international prototype in the
    /// form of a platinum-iridium cylinder kept at Sevres in France.
    static const BaseUnit<Mass> KILOGRAM = const BaseUnit<Mass>._("kg");

    /// The base unit for length quantities (`m`).
    ///
    /// One meter was redefined in 1983 as the distance traveled by light in
    /// a vacuum in 1/299,792,458 of a second.
    static const BaseUnit<Length> METRE = const BaseUnit<Length>._("m");

    /// Equivalent to [METRE] (American spelling).
    static const Unit<Length> METER = METRE;

    /// The base unit for amount of substance quantities (`mol`).
    ///
    /// The mole is the amount of substance of a system which contains as many
    /// elementary entities as there are atoms in 0.012 kilogram of carbon 12.
    static const BaseUnit<AmountOfSubstance> MOLE = const BaseUnit<AmountOfSubstance>._("mol");

    /// The base unit for duration quantities (`s`).
    ///
    /// It is defined as the duration of 9,192,631,770 cycles of radiation
    /// corresponding to the transition between two hyperfine levels of
    /// the ground state of cesium (1967 Standard).
    static const BaseUnit<Duration> SECOND = const BaseUnit<Duration>._("s");

    ////////////////////////////////
    // SI DERIVED ALTERNATE UNITS //
    ////////////////////////////////

    /// The derived unit for mass quantities (`g`).
    ///
    /// The base unit for mass quantity is [KILOGRAM].
    static const Unit<Mass> GRAM = const TransformedUnit<Mass>._(KILOGRAM, Em3);

    /// The unit for plane angle quantities (`rad`).
    ///
    /// One radian is the angle between two radii of a circle such that the
    /// length of the arc between them is equal to the radius.
    static const AlternateUnit<Angle> RADIAN = const AlternateUnit<Angle>._("rad", Unit.one);

    /// The unit for solid angle quantities (`sr`).
    ///
    /// One steradian is the solid angle subtended at the center of a sphere by
    /// an area on the surface of the sphere that is equal to the radius squared.
    /// The total solid angle of a sphere is 4*Pi steradians.
    static const AlternateUnit<SolidAngle> STERADIAN = const AlternateUnit<SolidAngle>._("sr", Unit.one);

    /// The unit for binary information (`bit`).
    static const AlternateUnit<DataAmount> BIT = const AlternateUnit<DataAmount>._("bit", Unit.one);

    /// The derived unit for frequency (`Hz`).
    ///
    /// A unit of frequency equal to one cycle per second.
    /// After Heinrich Rudolf Hertz (1857-1894), German physicist who was the
    /// first to produce radio waves artificially.
    static const AlternateUnit<Frequency> HERTZ = const AlternateUnit<Frequency>._("Hz",
        const ProductUnit._(const[const _RationalPower<Unit>(SECOND, const RationalNumber(-1))]));

    /// The derived unit for force (`N`).
    ///
    /// One newton is the force required to give a mass of 1 kilogram an Force
    /// of 1 metre per second per second. It is named after the English
    /// mathematician and physicist Sir Isaac Newton (1642-1727).
    static const AlternateUnit<Force> NEWTON = const AlternateUnit<Force>._(
        "N", const ProductUnit._(const[
        const _RationalPower(METRE),
        const _RationalPower(KILOGRAM),
        const _RationalPower(SECOND,const RationalNumber(-2))]));

    /// The derived unit for pressure, stress (`Pa`).
    ///
    /// One pascal is equal to one newton per square meter. It is named after
    /// the French philosopher and mathematician Blaise Pascal (1623-1662).
    static const AlternateUnit<Pressure> PASCAL = const AlternateUnit<Pressure>._(
            "Pa", const ProductUnit._(const[
        const _RationalPower<Unit>(NEWTON),
        const _RationalPower<Unit>(METRE,const RationalNumber(-2))]));

    /// The derived unit for energy, work, quantity of heat (`J`).
    ///
    /// One joule is the amount of work done when an applied force of 1 newton
    /// moves through a distance of 1 metre in the direction of the force.
    /// It is named after the English physicist James Prescott Joule (1818-1889).
    static const AlternateUnit<Energy> JOULE = const AlternateUnit<Energy>._(
            "J", const ProductUnit._(const[
        const _RationalPower<Unit>(NEWTON),
        const _RationalPower<Unit>(METRE)]));

    /// The derived unit for power, radiant, flux (`W`).
    ///
    /// One watt is equal to one joule per second. It is named after the British
    /// scientist James Watt (1736-1819).
    static const AlternateUnit<Power> WATT = const AlternateUnit<Power>._(
            "W", const ProductUnit._(const[
        const _RationalPower<Unit>(JOULE),
        const _RationalPower<Unit>(SECOND,const RationalNumber(-1))]));

    /// The derived unit for electric charge, quantity of electricity
    /// (`C`).
    ///
    /// One Coulomb is equal to the quantity of charge transferred in one second
    /// by a steady current of one ampere. It is named after the French physicist
    /// Charles Augustin de Coulomb (1736-1806).
    static const AlternateUnit<ElectricCharge> COULOMB = const AlternateUnit<ElectricCharge>._(
            "C", const ProductUnit._(const[
        const _RationalPower(SECOND),
        const _RationalPower(AMPERE)]));

    /// The derived unit for electric potential difference, electromotive force
    /// (`V`).
    ///
    /// One Volt is equal to the difference of electric potential between two
    /// points on a conducting wire carrying a constant current of one ampere
    /// when the power dissipated between the points is one watt. It is named
    /// after the Italian physicist Count Alessandro Volta (1745-1827).
    static const AlternateUnit<ElectricPotential> VOLT = const AlternateUnit<ElectricPotential>._(
            "V", const ProductUnit._(const[
        const _RationalPower<Unit>(WATT),
        const _RationalPower<Unit>(AMPERE,const RationalNumber(-1))]));

    /// The derived unit for capacitance (`F`).
    ///
    /// One Farad is equal to the capacitance of a capacitor having an equal
    /// and opposite charge of 1 coulomb on each plate and a potential difference
    /// of 1 volt between the plates. It is named after the British physicist
    /// and chemist Michael Faraday (1791-1867).
    static const AlternateUnit<ElectricCapacitance> FARAD = const AlternateUnit<ElectricCapacitance>._(
            "F", const ProductUnit._(const[
        const _RationalPower(COULOMB),
        const _RationalPower(VOLT,const RationalNumber(-1))]));

    /// The derived unit for electric resistance (`Ω` or `Ohm`).
    ///
    /// One Ohm is equal to the resistance of a conductor in which a current of
    /// one ampere is produced by a potential of one volt across its terminals.
    /// It is named after the German physicist Georg Simon Ohm (1789-1854).
    static const AlternateUnit<ElectricResistance> OHM = const AlternateUnit<ElectricResistance>._(
            "Ω", const ProductUnit._(const[
        const _RationalPower<Unit>(VOLT),
        const _RationalPower<Unit>(AMPERE,const RationalNumber(-1))]));

    /// The derived unit for electric conductance (`S`).
    ///
    /// One Siemens is equal to one ampere per volt. It is named after
    /// the German engineer Ernst Werner von Siemens (1816-1892).
    static const AlternateUnit<ElectricConductance> SIEMENS = const AlternateUnit<ElectricConductance>._(
            "S", const ProductUnit._(const[
        const _RationalPower<Unit>(AMPERE),
        const _RationalPower<Unit>(VOLT,const RationalNumber(-1))]));

    /// The derived unit for magnetic flux (`Wb`).
    ///
    /// One Weber is equal to the magnetic flux that in linking a circuit of one
    /// turn produces in it an electromotive force of one volt as it is uniformly
    /// reduced to zero within one second. It is named after the German physicist
    /// Wilhelm Eduard Weber (1804-1891).
    static const AlternateUnit<MagneticFlux> WEBER = const AlternateUnit<MagneticFlux>._(
            "Wb", const ProductUnit._(const[
        const _RationalPower<Unit>(VOLT),
        const _RationalPower<Unit>(SECOND)]));

    /// The derived unit for magnetic flux density (`T`).
    ///
    /// One Tesla is equal equal to one weber per square meter. It is named
    /// after the Serbian-born American electrical engineer and physicist
    /// Nikola Tesla (1856-1943).
    static const AlternateUnit<MagneticFluxDensity> TESLA = const AlternateUnit<MagneticFluxDensity>._(
            "T", const ProductUnit._(const[
        const _RationalPower<Unit>(WEBER),
        const _RationalPower<Unit>(METRE,const RationalNumber(-2))]));

    /// The derived unit for inductance (`H`).
    ///
    /// One Henry is equal to the inductance for which an induced electromotive
    /// force of one volt is produced when the current is varied at the rate of
    /// one ampere per second. It is named after the American physicist
    /// Joseph Henry (1791-1878).
    static const AlternateUnit<ElectricInductance> HENRY = const AlternateUnit<ElectricInductance>._(
            "H", const ProductUnit._(const[
        const _RationalPower<Unit>(WEBER),
        const _RationalPower<Unit>(AMPERE,const RationalNumber(-1))]));

    /// The derived unit for Celsius temperature (`℃`).
    ///
    /// This is a unit of temperature such as the freezing point of water
    /// (at one atmosphere of pressure) is 0 ℃, while the boiling point is
    /// 100 ℃.
    static const Unit<Temperature> CELSIUS = const AlternateUnit<Temperature>._(
        "℃", const TransformedUnit._(KELVIN, const AddConverter._(273.15)));

    /// The derived unit for luminous flux (`lm`).
    ///
    /// One Lumen is equal to the amount of light given out through a solid angle
    /// by a source of one candela intensity radiating equally in all directions.
    static const AlternateUnit<LuminousFlux> LUMEN = const AlternateUnit<LuminousFlux>._(
            "lm", const ProductUnit._(const[
        const _RationalPower<Unit>(CANDELA),
        const _RationalPower<Unit>(STERADIAN)]));

    /// The derived unit for illuminance (`lx`).
    ///
    /// One Lux is equal to one lumen per square meter.
    static const AlternateUnit<Illuminance> LUX = const AlternateUnit<Illuminance>._(
            "lx", const ProductUnit._(const[
        const _RationalPower<Unit>(LUMEN),
        const _RationalPower<Unit>(METER,const RationalNumber(-2))]));

    /// The derived unit for activity of a radionuclide (`Bq`).
    ///
    /// One becquerel is the radiation caused by one disintegration per second.
    /// It is named after the French physicist, Antoine-Henri Becquerel
    /// (1852-1908).
    static const AlternateUnit<RadioactiveActivity> BECQUEREL = const AlternateUnit<RadioactiveActivity>._(
            "Bq", const ProductUnit._(const[
        const _RationalPower<Unit>(Unit.one),
        const _RationalPower<Unit>(SECOND,const RationalNumber(-1))]));

    /// The derived unit for absorbed dose, specific energy (imparted), kerma
    /// (`Gy`).
    ///
    /// One gray is equal to the dose of one joule of energy absorbed per one
    /// kilogram of matter. It is named after the British physician
    /// L. H. Gray (1905-1965).
    static const AlternateUnit<RadiationDoseAbsorbed> GRAY = const AlternateUnit<RadiationDoseAbsorbed>._(
            "Gy", const ProductUnit._(const[
        const _RationalPower<Unit>(JOULE),
        const _RationalPower<Unit>(KILOGRAM,const RationalNumber(-1))]));

    /// The derived unit for dose equivalent (`Sv`).
    ///
    /// One Sievert is equal  is equal to the actual dose, in grays, multiplied
    /// by a "quality factor" which is larger for more dangerous forms of
    /// radiation. It is named after the Swedish physicist Rolf Sievert
    /// (1898-1966).
    static const AlternateUnit<RadiationDoseEffective> SIEVERT = const AlternateUnit<RadiationDoseEffective>._(
            "Sv", const ProductUnit._(const[
        const _RationalPower<Unit>(JOULE),
        const _RationalPower<Unit>(KILOGRAM,const RationalNumber(-1))]));

    /// The derived unit for catalytic activity (`kat`).
    static const AlternateUnit<CatalyticActivity> KATAL = const AlternateUnit<CatalyticActivity>._(
            "kat", const ProductUnit._(const[
        const _RationalPower<Unit>(MOLE),
        const _RationalPower<Unit>(SECOND,const RationalNumber(-1))]));

    //////////////////////////////
    // SI DERIVED PRODUCT UNITS //
    //////////////////////////////

    /// The metric unit for velocity quantities (`m/s`).
    static const Unit<Velocity> METRES_PER_SECOND = const ProductUnit<Velocity>._(const[
        const _RationalPower<Unit>(METRE),
        const _RationalPower<Unit>(SECOND,const RationalNumber(-1))]);

    /// Equivalent to [METRES_PER_SECOND] (American spelling).
    static const Unit<Velocity> METERS_PER_SECOND = METRES_PER_SECOND;

    /// The metric unit for acceleration quantities (`m/s²`).
    static const Unit<Acceleration> METRES_PER_SQUARE_SECOND = const ProductUnit<Acceleration>._(const[
        const _RationalPower<Unit>(METRE),
        const _RationalPower<Unit>(SECOND,const RationalNumber(-2))]);

    /// Equivalent to [METRES_PER_SQUARE_SECOND] (American spelling).
    static const Unit<Acceleration> METERS_PER_SQUARE_SECOND = METRES_PER_SQUARE_SECOND;

    /// The metric unit for area quantities (`m²`).
    static const Unit<Area> SQUARE_METRE = const ProductUnit<Area>._(const[
        const _RationalPower<Unit>(METRE,const RationalNumber(2))]);

    /// The metric unit for volume quantities (`m³`).
    static const Unit<Volume> CUBIC_METRE = const ProductUnit<Volume>._(const[
        const _RationalPower<Unit>(METRE,const RationalNumber(3))]);

    /// Equivalent to `KILO(METRE)`.
    static const Unit<Length> KILOMETRE = const TransformedUnit._(METRE, E3);

    /// Equivalent to [KILOMETRE] (American spelling).
    static const Unit<Length> KILOMETER = KILOMETRE;

    /// Equivalent to `CENTI(METRE)`.
    static const Unit<Length> CENTIMETRE = const TransformedUnit._(METRE, Em2);

    /// Equivalent to [CENTIMETRE] (American spelling).
    static const Unit<Length> CENTIMETER = CENTIMETRE;

    /// Equivalent to `MILLI(METRE)`.
    static const Unit<Length> MILLIMETRE =
        const TransformedUnit<Length>._(METRE, Em3);

    /// Equivalent to [MILLIMETRE] (American spelling).
    static const Unit<Length> MILLIMETER = MILLIMETRE;

    /////////////////
    // SI PREFIXES //
    /////////////////

    /// Returns the specified unit multiplied by the factor `10<sup>24</sup>`
    static Unit YOTTA(Unit unit) => unit.transform(E24);

    /// Returns the specified unit multiplied by the factor `10<sup>21</sup>`
    static Unit ZETTA(Unit unit) => unit.transform(E21);

    /// Returns the specified unit multiplied by the factor `10<sup>18</sup>`
    static Unit EXA(Unit unit) => unit.transform(E18);
    

    /// Returns the specified unit multiplied by the factor `10<sup>15</sup>`
    static Unit PETA(Unit unit) => unit.transform(E15);

    /// Returns the specified unit multiplied by the factor `10<sup>12</sup>`
    static Unit TERA(Unit unit) => unit.transform(E12);
    

    /// Returns the specified unit multiplied by the factor `10<sup>9</sup>`
    static Unit GIGA(Unit unit) => unit.transform(E9);
    

    /// Returns the specified unit multiplied by the factor `10<sup>6</sup>`
    static Unit MEGA(Unit unit) => unit.transform(E6);

    /// Returns the specified unit multiplied by the factor `10<sup>3</sup>`
    static Unit KILO(Unit unit) => unit.transform(E3);

    /// Returns the specified unit multiplied by the factor `10<sup>2</sup>`
    static Unit HECTO(Unit unit) => unit.transform(E2);

    /// Returns the specified unit multiplied by the factor `10<sup>1</sup>`
    static Unit DEKA(Unit unit) => unit.transform(E1);

    /// Returns the specified unit multiplied by the factor `10<sup>-1</sup>`
    static Unit DECI(Unit unit) => unit.transform(Em1);

    /// Returns the specified unit multiplied by the factor `10<sup>-2</sup>`
    static Unit CENTI(Unit unit) => unit.transform(Em2);

    /// Returns the specified unit multiplied by the factor `10<sup>-3</sup>`
    static Unit MILLI(Unit unit) => unit.transform(Em3);

    /// Returns the specified unit multiplied by the factor `10<sup>-6</sup>`
    static Unit MICRO(Unit unit) => unit.transform(Em6);

    /// Returns the specified unit multiplied by the factor `10<sup>-9</sup>`
    static Unit NANO(Unit unit) => unit.transform(Em9);

    /// Returns the specified unit multiplied by the factor `10<sup>-12</sup>`
    static Unit PICO(Unit unit) => unit.transform(Em12);

    /// Returns the specified unit multiplied by the factor `10<sup>-15</sup>`
    static Unit FEMTO(Unit unit) => unit.transform(Em15);

    /// Returns the specified unit multiplied by the factor `10<sup>-18</sup>`
    static Unit ATTO(Unit unit) => unit.transform(Em18);

    /// Returns the specified unit multiplied by the factor `10<sup>-21</sup>`
    static Unit ZEPTO(Unit unit) => unit.transform(Em21);

    /// Returns the specified unit multiplied by the factor `10<sup>-24</sup>`
    static Unit YOCTO(Unit unit) => unit.transform(Em24);

    // Holds prefix converters (optimization).

    static const MultiplyConverter E24 = const MultiplyConverter._(1E24);

    static const MultiplyConverter E21 = const MultiplyConverter._(1E21);

    static const RationalConverter E18 = const RationalConverter._(const RationalNumber(
            1000000000000000000));

    static const RationalConverter E15 = const RationalConverter._(const RationalNumber(
            1000000000000000));

    static const RationalConverter E12 = const RationalConverter._(const RationalNumber(1000000000000));

    static const RationalConverter E9 = const RationalConverter._(const RationalNumber(1000000000));

    static const RationalConverter E6 = const RationalConverter._(const RationalNumber(1000000));

    static const RationalConverter E3 = const RationalConverter._(const RationalNumber(1000));

    static const RationalConverter E2 = const RationalConverter._(const RationalNumber(100));

    static const RationalConverter E1 = const RationalConverter._(const RationalNumber(10));

    static const RationalConverter Em1 = const RationalConverter._(const RationalNumber(1, 10));

    static const RationalConverter Em2 = const RationalConverter._(const RationalNumber(1, 100));

    static const RationalConverter Em3 = const RationalConverter._(const RationalNumber(1, 1000));

    static const RationalConverter Em6 = const RationalConverter._(const RationalNumber(1, 1000000));

    static const RationalConverter Em9 = const RationalConverter._(const RationalNumber(1, 1000000000));

    static const RationalConverter Em12 = const RationalConverter._(const RationalNumber(1, 1000000000000));

    static const RationalConverter Em15 = const RationalConverter._(const RationalNumber(1, 1000000000000000));

    static const RationalConverter Em18 = const RationalConverter._(const RationalNumber(1, 1000000000000000000));

    static const MultiplyConverter Em21 = const MultiplyConverter._(1E-21);

    static const MultiplyConverter Em24 = const MultiplyConverter._(1E-24);

}


/// Contains units that are not part of the International System of Units, that
/// is, they are outside the SI, but are important and widely used.
abstract class NonSI extends SystemOfUnits {

    /// The standard gravity constant: 9.80665 m/s² exact.
    static const STANDARD_GRAVITY = const RationalNumber(980665, 100000);

    /// The international foot: 0.3048 m exact.
    static const INTERNATIONAL_FOOT = const RationalNumber(3048, 10000);

    /// The avoirdupois pound: 0.45359237 kg exact
    static const AVOIRDUPOIS_POUND = const RationalNumber(45359237, 100000000);

    /// The Avogadro constant.
    static const double AVOGADRO_CONSTANT = 6.02214199e23; // (1/mol).

    /// The electric charge of one electron.
    static const double ELEMENTARY_CHARGE = 1.602176462e-19; // (C).

    const NonSI._();
    
    ///////////////////
    // Dimensionless //
    ///////////////////

    /// A dimensionless unit equals to `0.01` (standard name `%`).
    static const Unit<Dimensionless> PERCENT = const TransformedUnit._(Unit.one, SI.Em2);

    /// A logarithmic unit used to describe a ratio (standard name `dB`).
    static const Unit<Dimensionless> DECIBEL = const TransformedUnit._(Unit.one,
        const _CompoundConverter(const RationalConverter._(const RationalNumber(1, 10)),
            const _InverseLogConverter(const LogConverter(10.0))));

    /////////////////////////
    // Amount of substance //
    /////////////////////////

    /// A unit of amount of substance equals to one atom (standard name `atom`).
    static const Unit<AmountOfSubstance> ATOM =  const TransformedUnit._(
        SI.MOLE, const MultiplyConverter._(1/AVOGADRO_CONSTANT));

    ////////////
    // Length //
    ////////////

    /// A unit of length equal to `0.3048 m` (standard name `ft`).
    static const Unit<Length> FOOT = const TransformedUnit._(SI.METRE,
        const RationalConverter._(INTERNATIONAL_FOOT));

    /// A unit of length equal to `1200/3937 m` (standard name `foot_survey_us`).
    static const Unit<Length> FOOT_SURVEY_US = const TransformedUnit._(SI.METRE,
        const RationalConverter._(const RationalNumber(1200,3937)));

    /// A unit of length equal to `0.9144 m` (standard name `yd`).
    static const Unit<Length> YARD = const TransformedUnit._(FOOT,
        const RationalConverter._(const RationalNumber(3)));

    /// A unit of length equal to `0.0254 m` (standard name `in`).
    static const Unit<Length> INCH = const TransformedUnit._(FOOT,
        const RationalConverter._(const RationalNumber(1,12)));

    /// A unit of length equal to `1609.344 m` (standard name `mi`).
    static const Unit<Length> MILE = const TransformedUnit._(SI.METRE,
        const RationalConverter._(const RationalNumber(1609344,1000)));

    /// A unit of length equal to `1852.0 m` (standard name `nmi`).
    static const Unit<Length> NAUTICAL_MILE = const TransformedUnit._(SI.METRE,
        const RationalConverter._(const RationalNumber(1852)));

    /// A unit of length equal to `1E-10 m` (standard name `Å`).
    static const Unit<Length> ANGSTROM = const TransformedUnit._(SI.METRE,
        const RationalConverter._(const RationalNumber(1,10000000000)));

    /// A unit of length equal to the average distance from the center of the
    /// Earth to the center of the Sun (standard name `ua`).
    static const Unit<Length> ASTRONOMICAL_UNIT = const TransformedUnit._(SI.METRE,
        const RationalConverter._(const RationalNumber(149597870691,1)));

    /// A unit of length equal to the distance that light travels in one year
    /// through a vacuum (standard name `ly`).
    static const Unit<Length> LIGHT_YEAR = const TransformedUnit._(SI.METRE,
        const MultiplyConverter._(9.460528405e15));

    /// A unit of length equal to the distance at which a star would appear to
    /// shift its position by one arcsecond over the course the time
    /// (about 3 months) in which the Earth moves a distance of
    /// [ASTRONOMICAL_UNIT] in the direction perpendicular to the
    /// direction to the star (standard name `pc`).
    static const Unit<Length> PARSEC = const TransformedUnit._(SI.METRE,
        const MultiplyConverter._(30856770e9));

    /// A unit of length equal to `0.013837 [INCH]` exactly (standard name `pt`).
    static const Unit<Length> POINT = const TransformedUnit._(NonSI.INCH,
        const RationalConverter._(const RationalNumber(13837,1000000)));

    /// A unit of length equal to `1/72 [INCH]` (standard name `pixel`).
    ///
    /// It is the American point rounded to an even 1/72 inch.
    static const Unit<Length> PIXEL = const TransformedUnit._(NonSI.INCH,
        const RationalConverter._(const RationalNumber(1,72)));

    /// Equivalent [PIXEL]
    static const Unit<Length> COMPUTER_POINT = PIXEL;

    //////////////
    // Duration //
    //////////////

    /// A unit of duration equal to `60 s` (standard name `min`).
    static const Unit<Duration> MINUTE = const TransformedUnit._(
        SI.SECOND, const RationalConverter._(const RationalNumber(60)));

    /// A unit of duration equal to `60 [MINUTE]` (standard name `h`).
    static const Unit<Duration> HOUR = const TransformedUnit._(
        SI.SECOND, const RationalConverter._(const RationalNumber(60*60)));

    /// A unit of duration equal to `24 [HOUR]` (standard name `d`).
    static const Unit<Duration> DAY = const TransformedUnit._(
        SI.SECOND, const RationalConverter._(const RationalNumber(60*60*24)));
    /// A unit of duration equal to `7 [DAY]` (standard name `week`).
    static const Unit<Duration> WEEK = const TransformedUnit._(
        SI.SECOND, const RationalConverter._(const RationalNumber(60*60*24*7)));

    /// A unit of duration equal to 365 days, 5 hours, 49 minutes,
    /// and 12 seconds (standard name `year`).
    static const Unit<Duration> YEAR = const TransformedUnit._(
        SI.SECOND, const RationalConverter._(const RationalNumber(31556952)));

    /// A unit of duration equal to one twelfth of a year (standard name `month`).
    static const Unit<Duration> MONTH = const TransformedUnit._(
        SI.SECOND, const RationalConverter._(const RationalNumber(31556952, 12)));

    /// A unit of duration equal to the time required for a complete rotation of
    /// the earth in reference to any star or to the vernal equinox at the
    /// meridian, equal to 23 hours, 56 minutes, 4.09 seconds
    /// (standard name `day_sidereal`).
    static const Unit<Duration> DAY_SIDEREAL = const TransformedUnit._(
        SI.SECOND, const MultiplyConverter._(86164.09));

    /// A unit of duration equal to one complete revolution of the
    /// earth about the sun, relative to the fixed stars, or 365 days, 6 hours,
    /// 9 minutes, 9.54 seconds (standard name `year_sidereal`).
    static const Unit<Duration> YEAR_SIDEREAL = const TransformedUnit._(
        SI.SECOND, const MultiplyConverter._(31558149.54));

    /// A unit of duration equal to `365 [DAY]` (standard name `year_calendar`).
    static const Unit<Duration> YEAR_CALENDAR = const TransformedUnit._(
        SI.SECOND, const RationalConverter._(const RationalNumber(60*60*24*365)));

    //////////
    // Mass //
    //////////

    /// A unit of mass equal to 1/12 the mass of the carbon-12 atom
    /// (standard name `u`).
    static const Unit<Mass> ATOMIC_MASS = const TransformedUnit._(SI.KILOGRAM,
        const MultiplyConverter._(1e-3 / AVOGADRO_CONSTANT));

    /// A unit of mass equal to the mass of the electron (standard name `me`).
    static const Unit<Mass> ELECTRON_MASS = const TransformedUnit._(SI.KILOGRAM,
        const MultiplyConverter._(9.10938188e-31));

    /// A unit of mass equal to `453.59237 grams` (avoirdupois pound,
    /// standard name `lb`).
    static const Unit<Mass> POUND = const TransformedUnit._(SI.KILOGRAM,
        const RationalConverter._(AVOIRDUPOIS_POUND));

    /// A unit of mass equal to `1 / 16 [POUND]` (standard name `oz`).
    static const Unit<Mass> OUNCE = const TransformedUnit._(NonSI.POUND,
        const RationalConverter._(const RationalNumber(1,16)));

    /// A unit of mass equal to `2000 [POUND]` (short ton, standard name `ton_us`).
    static const Unit<Mass> TON_US = const TransformedUnit._(NonSI.POUND,
        const RationalConverter._(const RationalNumber(2000)));

    /// A unit of mass equal to `2240 [POUND]` (long ton, standard name `ton_uk`).
    static const Unit<Mass> TON_UK = const TransformedUnit._(NonSI.POUND,
        const RationalConverter._(const RationalNumber(2240)));

    /// A unit of mass equal to `1000 kg` (metric ton, standard name `t`).
    static const Unit<Mass> METRIC_TON = const TransformedUnit._(SI.KILOGRAM,SI.E3);

    /////////////////////
    // Electric charge //
    /////////////////////

    /// A unit of electric charge equal to the charge on one electron
    /// (standard name `e`).
    static const Unit<ElectricCharge> E = const TransformedUnit._(SI.COULOMB,
        const MultiplyConverter._(ELEMENTARY_CHARGE));

    /// A unit of electric charge equal to equal to the product of Avogadro's
    /// number (see [MOLE]) and the charge (1 e) on a single electron
    /// (standard name `Fd`).
    static const Unit<ElectricCharge> FARADAY = const TransformedUnit._(SI.COULOMB,
        const MultiplyConverter._(ELEMENTARY_CHARGE * AVOGADRO_CONSTANT));

    /// A unit of electric charge which exerts a force of one dyne on an equal
    /// charge at a distance of one centimeter (standard name `Fr`).
    static const Unit<ElectricCharge> FRANKLIN = const TransformedUnit._(SI.COULOMB,
        const MultiplyConverter._(3.3356e-10));

    /////////////////
    // Temperature //
    /////////////////

    /// A unit of temperature equal to `5/9 °K` (standard name `°R`).
    static const Unit<Temperature> RANKINE = const TransformedUnit._(SI.KELVIN,
        const RationalConverter._(const RationalNumber(5,9)));

    /// A unit of temperature equal to degree Rankine minus `459.67 °R`
    /// (standard name `°F`).
    static const Unit<Temperature> FAHRENHEIT = const TransformedUnit._(RANKINE,
        const AddConverter._(459.67));

    ///////////
    // Angle //
    ///////////

    /// A unit of angle equal to a full circle or `2<i>&pi;</i> [SI.RADIAN]`
    /// (standard name `rev`).
    static const Unit<Angle> REVOLUTION = const TransformedUnit<Angle>._(
        SI.RADIAN, const MultiplyConverter._(2.0 * Math.PI));

    /// A unit of angle equal to `1/360 [REVOLUTION]` (standard name `°`).
    static const Unit<Angle> DEGREE_ANGLE = const TransformedUnit<Angle>._(
        SI.RADIAN, const MultiplyConverter._(Math.PI/180));

    /// A unit of angle equal to `1/60 [DEGREE_ANGLE]` (standard name `′`).
    static const Unit<Angle> MINUTE_ANGLE = const TransformedUnit<Angle>._(
        SI.RADIAN, const MultiplyConverter._(Math.PI/180/60));

    /// A unit of angle equal to `1/60 [MINUTE_ANGLE]` (standard name `"`).
    static const Unit<Angle> SECOND_ANGLE = const TransformedUnit<Angle>._(
        SI.RADIAN, const MultiplyConverter._(Math.PI/180/60/60));

    /// A unit of angle equal to `0.01 [SI.RADIAN]` (standard name `centiradian`).
    static const Unit<Angle> CENTIRADIAN = const TransformedUnit<Angle>._(
        SI.RADIAN, SI.Em2);

    /// A unit of angle measure equal to `1/400 [REVOLUTION]`
    /// (standard name `grade`).
    static const Unit<Angle> GRADE = const TransformedUnit<Angle>._(
        NonSI.REVOLUTION, const RationalConverter._(const RationalNumber(1, 400)));

    //////////////
    // Velocity //
    //////////////

    /// A unit of velocity expressing the number of international
    /// [MILE] per [HOUR] (abbreviation `mph`).
    static const Unit<Velocity> MILES_PER_HOUR
         = const ProductUnit._(const [
             const _RationalPower<Unit>(NonSI.MILE),
             const _RationalPower<Unit>(NonSI.HOUR,const RationalNumber(-1))
         ]);

    /// A unit of velocity expressing the number of [SI.KILOMETRE] per [HOUR].
    static const Unit<Velocity> KILOMETRES_PER_HOUR
         = const ProductUnit._(const [
             const _RationalPower<Unit>(SI.KILOMETER),
             const _RationalPower<Unit>(NonSI.HOUR,const RationalNumber(-1))
         ]);

    /// Equivalent to [KILOMETRES_PER_HOUR].
    static const Unit<Velocity> KILOMETERS_PER_HOUR = KILOMETRES_PER_HOUR;

    /// A unit of velocity expressing the number of [NAUTICAL_MILE] per [HOUR]
    /// (abbreviation `kn`).
    static const Unit<Velocity> KNOT
         = const ProductUnit._(const [
             const _RationalPower<Unit>(NonSI.NAUTICAL_MILE),
             const _RationalPower<Unit>(NonSI.HOUR,const RationalNumber(-1))
         ]);

    /// A unit of velocity to express the speed of an aircraft relative to
    /// the speed of sound (standard name `Mach`).
    static const Unit<Velocity> MACH = const TransformedUnit._(SI.METERS_PER_SECOND,
        const MultiplyConverter._(331.6));

    /// A unit of velocity relative to the speed of light
    /// (standard name `c`).
    static const Unit<Velocity> C = const TransformedUnit._(SI.METERS_PER_SECOND,
        const RationalConverter._(const RationalNumber(299792458,1)));

    //////////////////
    // Acceleration //
    //////////////////

    /// A unit of acceleration equal to the gravity at the earth's surface
    /// (standard name `grav`).
    static const Unit<Acceleration> G = const TransformedUnit._(SI.METRES_PER_SQUARE_SECOND,
        const RationalConverter._(STANDARD_GRAVITY));

    //////////
    // Area //
    //////////

    /// A unit of area equal to `100 m²`
    /// (standard name `a`).
    static const Unit<Area> ARE = const TransformedUnit._(SI.SQUARE_METRE,SI.E2);

    /// A unit of area equal to `100 [ARE]`
    /// (standard name `ha`).
    static const Unit<Area> HECTARE = const TransformedUnit._(NonSI.ARE,SI.E2);

    /////////////////
    // Data Amount //
    /////////////////

    /// A unit of data amount equal to `8 [SI.BIT]`
    /// (BinarY TErm, standard name `byte`).
    static const Unit<DataAmount> BYTE = const TransformedUnit._(SI.BIT,
        const RationalConverter._(const RationalNumber(8)));

    /// Equivalent [BYTE]
    static const Unit<DataAmount> OCTET = BYTE;


    //////////////////////
    // Electric current //
    //////////////////////

    /// A unit of electric charge equal to the centimeter-gram-second
    /// electromagnetic unit of magnetomotive force, equal to `10/4
    /// &pi;ampere-turn` (standard name `Gi`).
    static const Unit<ElectricCurrent> GILBERT = const TransformedUnit._(SI.AMPERE,
        const MultiplyConverter._(10.0 / (4.0 * Math.PI)));

    ////////////
    // Energy //
    ////////////

    /// A unit of energy equal to `1E-7 J`
    /// (standard name `erg`).
    static const Unit<Energy> ERG = const TransformedUnit._(SI.JOULE,
        const RationalConverter._(const RationalNumber(1,10000000)));

    /// A unit of energy equal to one electron-volt (standard name
    /// `eV`, also recognized `keV, MeV, GeV`).
    static const Unit<Energy> ELECTRON_VOLT = const TransformedUnit._(SI.JOULE,
        const MultiplyConverter._(ELEMENTARY_CHARGE));

    /////////////////
    // Illuminance //
    /////////////////

    /// A unit of illuminance equal to `1E4 Lx`
    /// (standard name `La`).
    static const Unit<Illuminance> LAMBERT = const TransformedUnit._(SI.LUX,
        const RationalConverter._(const RationalNumber(10000)));

    ///////////////////
    // Magnetic Flux //
    ///////////////////

    /// A unit of magnetic flux equal `1E-8 Wb`
    /// (standard name `Mx`).
    static const Unit<MagneticFlux> MAXWELL = const TransformedUnit._(SI.WEBER,
        const RationalConverter._(const RationalNumber(1,100000000)));

    ///////////////////////////
    // Magnetic Flux Density //
    ///////////////////////////

    /// A unit of magnetic flux density equal `1000 A/m`
    /// (standard name `G`).
    static const Unit<MagneticFluxDensity> GAUSS = const TransformedUnit._(SI.TESLA,
        const RationalConverter._(const RationalNumber(1,10000)));

    ///////////
    // Force //
    ///////////

    /// A unit of force equal to `1E-5 N`
    /// (standard name `dyn`).
    static const Unit<Force> DYNE = const TransformedUnit._(SI.NEWTON,
        const RationalConverter._(const RationalNumber(1,100000)));

    /// A unit of force equal to `9.80665 N`
    /// (standard name `kgf`).
    static const Unit<Force> KILOGRAM_FORCE = const TransformedUnit._(SI.NEWTON,
        const RationalConverter._(STANDARD_GRAVITY));

    /// A unit of force equal to `[POUND]·[G]`
    /// (standard name `lbf`).
    static const Unit<Force> POUND_FORCE = const TransformedUnit._(SI.NEWTON,
        const RationalConverter._(const RationalNumber(
            45359237 * 980665, 100000000 * 100000)));

    ///////////
    // Power //
    ///////////

    /// A unit of power equal to the power required to raise a mass of 75
    /// kilograms at a velocity of 1 meter per second (metric,
    /// standard name `hp`).
    static const Unit<Power> HORSEPOWER = const TransformedUnit._(SI.WATT,
        const MultiplyConverter._(735.499));

    //////////////
    // Pressure //
    //////////////

    /// A unit of pressure equal to the average pressure of the Earth's
    /// atmosphere at sea level (standard name `atm`).
    static const Unit<Pressure> ATMOSPHERE = const TransformedUnit._(SI.PASCAL,
        const RationalConverter._(const RationalNumber(1,101325)));

    /// A unit of pressure equal to `100 kPa`
    /// (standard name `bar`).
    static const Unit<Pressure> BAR = const TransformedUnit._(SI.PASCAL,
        const RationalConverter._(const RationalNumber(1,100000)));

    /// A unit of pressure equal to the pressure exerted at the Earth's
    /// surface by a column of mercury 1 millimeter high
    /// (standard name `mmHg`).
    static const Unit<Pressure> MILLIMETER_OF_MERCURY = const TransformedUnit._(SI.PASCAL,
        const MultiplyConverter._(133.322));

    /// A unit of pressure equal to the pressure exerted at the Earth's
    /// surface by a column of mercury 1 inch high
    /// (standard name `inHg`).
    static const Unit<Pressure> INCH_OF_MERCURY = const TransformedUnit._(SI.PASCAL,
        const MultiplyConverter._(3386.388));

    /////////////////////////////
    // Radiation dose absorbed //
    /////////////////////////////

    /// A unit of radiation dose absorbed equal to a dose of 0.01 joule of
    /// energy per kilogram of mass (J/kg) (standard name `rd`).
    static const Unit<RadiationDoseAbsorbed> RAD = const TransformedUnit._(SI.GRAY,SI.Em2);

    /// A unit of radiation dose effective equal to `0.01 Sv`
    /// (standard name `rem`).
    static const Unit<RadiationDoseEffective> REM = const TransformedUnit._(SI.SIEVERT,SI.Em2);

    //////////////////////////
    // Radioactive activity //
    //////////////////////////

    /// A unit of radioctive activity equal to the activity of a gram of radium
    /// (standard name `Ci`).
    static const Unit<RadioactiveActivity> CURIE = const TransformedUnit._(SI.BECQUEREL,
    const RationalConverter._(const RationalNumber(37000000000)));

    /// A unit of radioctive activity equal to 1 million radioactive
    /// disintegrations per second (standard name `Rd`).
    static const Unit<RadioactiveActivity> RUTHERFORD = const TransformedUnit._(SI.BECQUEREL,SI.E6);

    /////////////////
    // Solid angle //
    /////////////////

    /// A unit of solid angle equal to `4 <i>&pi;</i> steradians`
    /// (standard name `sphere`).
    static const Unit<SolidAngle> SPHERE = const TransformedUnit._(SI.STERADIAN,
        const MultiplyConverter._(4.0 * Math.PI));

    ////////////
    // Volume //
    ////////////

    /// A unit of volume equal to one cubic decimeter (default label
    /// `L`, also recognized `µL, mL, cL, dL`).
    static const Unit<Volume> LITRE = const TransformedUnit._(SI.CUBIC_METRE,SI.Em3);

    /// Equivalent to [LITRE] (American spelling).
    static const Unit<Volume> LITER = LITRE;

    /// A unit of volume equal to one cubic inch (`in³`).
    static const Unit<Volume> CUBIC_INCH = const ProductUnit._(const [
        const _RationalPower<Unit>(INCH,const RationalNumber(3))]);

    /// A unit of volume equal to one US gallon, Liquid Unit. The U.S. liquid
    /// gallon is based on the Queen Anne or Wine gallon occupying 231 cubic
    /// inches (standard name `gal`).
    static const Unit<Volume> GALLON_LIQUID_US = const TransformedUnit._(CUBIC_INCH,
    const RationalConverter._(const RationalNumber(231,1)));

    /// A unit of volume equal to `1 / 128 [GALLON_LIQUID_US]`
    /// (standard name `oz_fl`).
    static const Unit<Volume> OUNCE_LIQUID_US = const TransformedUnit._(GALLON_LIQUID_US,
        const RationalConverter._(const RationalNumber(1,128)));

    /// A unit of volume equal to one US dry gallon.
    /// (standard name `gallon_dry_us`).
    static const Unit<Volume> GALLON_DRY_US = const TransformedUnit._(CUBIC_INCH,
        const RationalConverter._(const RationalNumber(2688025,10000)));

    /// A unit of volume equal to `4.546 09 [LITRE]`
    /// (standard name `gal_uk`).
    static const Unit<Volume> GALLON_UK = const TransformedUnit._(LITRE,
        const RationalConverter._(const RationalNumber(454609,100000)));

    /// A unit of volume equal to `1 / 160 [GALLON_UK]`
    /// (standard name `oz_fl_uk`).
    static const Unit<Volume> OUNCE_LIQUID_UK = const TransformedUnit._(GALLON_UK,
        const RationalConverter._(const RationalNumber(1,160)));

    ///////////////
    // Viscosity //
    ///////////////

    /// A unit of dynamic viscosity equal to `1 g/(cm·s)` (cgs unit).
    static const Unit<DynamicViscosity> POISE = const ProductUnit._(const [
        const _RationalPower<Unit>(SI.GRAM),
        const _RationalPower<Unit>(SI.CENTIMETER,const RationalNumber(-1)),
        const _RationalPower<Unit>(SI.SECOND,const RationalNumber(-1))
    ]);

    /// A unit of kinematic viscosity equal to `1 cm²/s` (cgs unit).
    static const Unit<KinematicViscosity> STOKE = const ProductUnit._(const [
        const _RationalPower<Unit>(SI.CENTIMETER,const RationalNumber(2)),
        const _RationalPower<Unit>(SI.SECOND,const RationalNumber(-1))
    ]);

    ////////////
    // Others //
    ////////////

    /// A unit used to measure the ionizing ability of radiation
    /// (standard name `Roentgen`).
    static const Unit ROENTGEN = const TransformedUnit._(const ProductUnit._(const [
        const _RationalPower<Unit>(SI.COULOMB),
        const _RationalPower<Unit>(SI.KILOGRAM,const RationalNumber(-1))
    ]), const MultiplyConverter._(2.58e-4));


}
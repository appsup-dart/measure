part of '../unit.dart';

abstract class Quantity {
  const Quantity();

  /// The SI unit (Système International d'Unités) for this quantity
  Unit get siUnit;
}

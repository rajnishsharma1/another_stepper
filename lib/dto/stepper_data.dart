import 'package:flutter/material.dart';

class StepperData {
  /// title for the stepper
  final String? title;

  /// subtitle for the stepper
  final String? subtitle;

  final Widget? iconWidget;

  /// Use the constructor of [StepperData] to pass the data needed.
  StepperData({this.iconWidget, this.title, this.subtitle});
}
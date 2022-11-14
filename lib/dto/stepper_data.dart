import 'package:flutter/material.dart';

typedef OnTab = void Function(int);
typedef OnDoubleTab = void Function(int);
typedef OnTabDown = void Function(int);
typedef OnTabUp = void Function(int);
typedef OnLongPress = void Function(int);


class StepperData {
  /// title for the stepper
  final Widget? title;

  /// subtitle for the stepper
  final Widget? subtitle;

  final Widget? iconWidget;

  final OnTab? onTab;
  final OnDoubleTab? onDoubleTab;
  final OnTabDown? onTabDown;
  final OnTabUp? onTabUp;
  final OnLongPress? onLongPress;

  /// Use the constructor of [StepperData] to pass the data needed.
  StepperData(
      {this.iconWidget,
      this.title,
      this.subtitle,
      this.onDoubleTab,
      this.onLongPress,
      this.onTabUp,
      this.onTabDown,
      this.onTab});
}

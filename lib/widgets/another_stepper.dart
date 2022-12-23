import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/horizontal_stepper.dart';
import 'package:another_stepper/widgets/vertical_stepper.dart';
import 'package:flutter/material.dart';

class AnotherStepper extends StatelessWidget {
  /// Another stepper is a package, which helps build
  /// customizable and easy to manage steppers.
  ///
  /// The package and be used to build horizontal as well
  /// as vertical steppers just by providing [Axis] in the [gap] parameter.
  const AnotherStepper({
    Key? key,
    required this.stepperList,
    this.gap = 40,
    this.activeIndex = 0,
    required this.stepperDirection,
    this.inverted = false,
    this.activeBarColor = Colors.blue,
    this.inActiveBarColor = Colors.grey,
    this.barThickness = 2,
    this.barThicknessRadius = 0,
    this.scrollPhysics,
    this.iconHeight,
    this.iconWidth,
  }) : super(key: key);

  /// Stepper [List] of type [StepperData] to inflate stepper with data
  final List<StepperData> stepperList;

  /// Gap between the items in the stepper, Default = 40
  /// (Recommended to keep it greater than 20 in [Axis.vertical])
  /// (Recommended to keep it greater than 40 in [Axis.horizontal])
  final double gap;

  /// Active index, till which [index] the stepper will be highlighted
  final int activeIndex;

  /// Stepper direction takes [Axis]
  /// Use [Axis.horizontal] to get horizontal stepper
  /// Use [Axis.vertical] to get vertical stepper
  final Axis stepperDirection;

  /// Inverts the stepper with text that is being used
  final bool inverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness/height
  final double barThickness;

  /// Bar raduis/thickness Default = 0
  final double barThicknessRadius;

  /// Height of [StepperData.iconWidget]
  ///
  /// Default value = 20
  final double? iconHeight;

  /// Width of [StepperData.iconWidget]
  ///
  /// Default value = 20
  final double? iconWidth;

  /// Scroll physics for listview
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    var crossAxisAlign = stepperDirection == Axis.horizontal
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    if (inverted) {
      // invert Alignment in case of [Axis.vertical]
      crossAxisAlign = crossAxisAlign == CrossAxisAlignment.end
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end;
    }
    final Iterable<int> iterable = Iterable<int>.generate(stepperList.length);
    return Flex(
      crossAxisAlignment: crossAxisAlign,
      direction: stepperDirection,
      children: iterable
          .map((index) => _getPreferredStepper(context, index: index))
          .toList(),
    );
  }

  Widget _getPreferredStepper(BuildContext context, {required int index}) {
    if (stepperDirection == Axis.horizontal) {
      return HorizontalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor,
        activeBarColor: activeBarColor,
        barHeight: barThickness,
        barRadius: barThicknessRadius,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
      );
    } else {
      return VerticalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        gap: gap,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor,
        activeBarColor: activeBarColor,
        barWidth: barThickness,
        barRadius: barThicknessRadius,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
      );
    }
  }
}

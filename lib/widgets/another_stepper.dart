import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/horizontal_stepper.dart';
import 'package:flutter/material.dart';

class AnotherStepper extends StatelessWidget {
  const AnotherStepper({
    Key? key,
    required this.stepperList,
    this.gap = 40,
    this.activeIndex = 0,
    required this.horizontalStepperHeight,
    required this.stepperDirection,
  }) : super(key: key);
  final List<StepperData> stepperList;
  final double gap;
  final int activeIndex;
  final double horizontalStepperHeight;
  final Axis stepperDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          stepperDirection == Axis.horizontal ? horizontalStepperHeight : null,
      child: IntrinsicHeight(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: stepperList.length,
          padding: EdgeInsets.zero,
          scrollDirection: stepperDirection,
          itemBuilder: (ctx, index) => HorizontalStepperItem(
            index: index,
            item: stepperList[index],
            totalLength: stepperList.length,
            gap: gap,
            activeIndex: activeIndex,
          ),
        ),
      ),
    );
  }
}

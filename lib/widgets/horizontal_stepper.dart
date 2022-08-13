import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/stepper_dot_widget.dart';
import 'package:flutter/material.dart';

class HorizontalStepperItem extends StatelessWidget {
  const HorizontalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.gap,
      required this.activeIndex})
      : super(key: key);
  final StepperData item;
  final int index;
  final int totalLength;
  final double gap;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    print("index: $index, activeIndex: $activeIndex");
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (item.title != null && item.title != "") ...[
          SizedBox(
              width: gap + 20,
              child: Text(
                item.title!,
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 4),
        ],
        if (item.title != null && item.title != "") ...[
          SizedBox(
              width: gap + 20,
              child: Text(
                item.subtitle!,
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 8),
        ],
        Row(
          children: [
            Container(
              color: index == 0
                  ? Colors.transparent
                  : (index <= activeIndex ? Colors.black : Colors.grey),
              width: gap,
              height: 1,
            ),
            StepperDot(
              index: index,
              totalLength: totalLength,
              activeIndex: activeIndex,
            ),
            Container(
              color: index == totalLength - 1
                  ? Colors.transparent
                  : (index < activeIndex ? Colors.black : Colors.grey),
              width: gap,
              height: 1,
            ),
          ],
        ),
      ],
    );
  }
}

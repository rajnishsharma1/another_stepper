import 'package:flutter/material.dart';

class StepperDot extends StatelessWidget {
  /// Default stepper dot
  const StepperDot({
    Key? key,
    required this.index,
    required this.totalLength,
    required this.activeIndex,
  }) : super(key: key);

  final int index;
  final int totalLength;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        border: Border.all(
          color: (index <= activeIndex) ? Colors.black : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Container(
        height: 10,
        width: 10,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: (index <= activeIndex) ? Colors.black : Colors.grey,
          border: Border.all(
            color: (index <= activeIndex) ? Colors.black : Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}

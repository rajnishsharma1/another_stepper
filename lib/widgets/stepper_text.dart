import 'package:flutter/material.dart';

class StepperText extends StatelessWidget {
  /// text for the stepper
  final String text;

  /// textStyle for stepper
  final TextStyle? textStyle;

  const StepperText(
    this.text, {
    Key? key,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ??
            const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

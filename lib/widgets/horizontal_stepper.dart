import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/utils/utils.dart';
import 'package:another_stepper/widgets/stepper_dot_widget.dart';
import 'package:flutter/material.dart';

class HorizontalStepperItem extends StatelessWidget {
  /// Stepper Item to show horizontal stepper
  const HorizontalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barHeight,
      required this.titleTextStyle,
      required this.subtitleTextStyle,
      this.iconHeight,
      this.iconWidth})
      : super(key: key);

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperData item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar height/thickness
  final double barHeight;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  /// Height of [StepperData.iconWidget]
  final double? iconHeight;

  /// Width of [StepperData.iconWidget]
  final double? iconWidth;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isInverted ? getInvertedChildren() : getChildren(),
      ),
    );
  }

  List<Widget> getChildren() {
    final Widget dot = SizedBox(
      height: iconHeight,
      width: iconWidth,
      child: item.iconWidget ??
          StepperDot(
            index: index,
            totalLength: totalLength,
            activeIndex: activeIndex,
          ),
    );

    return [
      if (item.title != null) ...[
        SizedBox(
            child: Text(
          item.title!,
          textAlign: TextAlign.center,
          style: titleTextStyle,
        )),
        const SizedBox(height: 4),
      ],
      if (item.subtitle != null) ...[
        SizedBox(
            child: Text(
          item.subtitle!,
          textAlign: TextAlign.center,
          style: subtitleTextStyle,
        )),
        const SizedBox(height: 8),
      ],
      Row(
        children: [
          Flexible(
            child: Container(
              color: index == 0
                  ? Colors.transparent
                  : (index <= activeIndex ? activeBarColor : inActiveBarColor),
              height: barHeight,
            ),
          ),
          index <= activeIndex
              ? dot
              : ColorFiltered(
                  colorFilter: Utils.getGreyScaleColorFilter(),
                  child: dot,
                ),
          Flexible(
            child: Container(
              color: index == totalLength - 1
                  ? Colors.transparent
                  : (index < activeIndex ? activeBarColor : inActiveBarColor),
              height: barHeight,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}

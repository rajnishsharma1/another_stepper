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
      required this.gap,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barHeight,
      required this.dotWidget,
      required this.titleTextStyle,
      required this.subtitleTextStyle})
      : super(key: key);

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperData item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Gap between the items in the stepper
  final double gap;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar height/thickness
  final double barHeight;

  /// [Widget] for dot/point
  final Widget? dotWidget;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      if (item.title != null) ...[
        SizedBox(
            width: gap + 20,
            child: Text(
              item.title!,
              textAlign: TextAlign.center,
              style: titleTextStyle,
            )),
        const SizedBox(height: 4),
      ],
      if (item.subtitle != null) ...[
        SizedBox(
            width: gap + 20,
            child: Text(
              item.subtitle!,
              textAlign: TextAlign.center,
              style: subtitleTextStyle,
            )),
        const SizedBox(height: 8),
      ],
      Row(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeBarColor : inActiveBarColor),
            width: gap,
            height: barHeight,
          ),
          index <= activeIndex
              ? dotWidget ??
                  StepperDot(
                    index: index,
                    totalLength: totalLength,
                    activeIndex: activeIndex,
                  )
              : ColorFiltered(
                  colorFilter: Utils.getGreyScaleColorFilter(),
                  child: dotWidget ??
                      StepperDot(
                        index: index,
                        totalLength: totalLength,
                        activeIndex: activeIndex,
                      ),
                ),
          Container(
            color: index == totalLength - 1
                ? Colors.transparent
                : (index < activeIndex ? activeBarColor : inActiveBarColor),
            width: gap,
            height: barHeight,
          ),
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}

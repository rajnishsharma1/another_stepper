import 'package:another_stepper/dto/handle_event.dart';
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

  /// Height of [StepperData.iconWidget]
  final double? iconHeight;

  /// Width of [StepperData.iconWidget]
  final double? iconWidth;

  bool isWidgetTouchEnabled(StepperData widget) {
    return widget.onTab != null ||
        widget.onDoubleTab != null ||
        widget.onLongPress != null ||
        widget.onTabDown != null ||
        widget.onTabUp != null;
  }

  bool get enabled => isWidgetTouchEnabled(item);

  void handleTabEvent(
      {required OnTouchHandleType type,
      TapDownDetails? downDetails,
      TapUpDetails? upDetails}) {
    if (!enabled) {
      return;
    }
    if (type == OnTouchHandleType.onTab) {
      item.onTab?.call(index);
    }
    if (type == OnTouchHandleType.onTabUp) {
      item.onTabUp?.call(index);
    }
    if (type == OnTouchHandleType.onTabDown) {
      item.onTabDown?.call(index);
    }
    if (type == OnTouchHandleType.onDoubleTab) {
      item.onDoubleTab?.call(index);
    }
    if (type == OnTouchHandleType.onLongPress) {
      item.onLongPress?.call(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: isInverted ? getInvertedChildren() : getChildren(),
    ));
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
    List<Widget> widget = [];
    if (!isInverted) {
      item.title != null
          ? widget.addAll([item.title!, const SizedBox(height: 4)])
          : null;
      item.subtitle != null
          ? widget.addAll([item.subtitle!, const SizedBox(height: 8)])
          : null;
    } else {
      item.subtitle != null
          ? widget.addAll([const SizedBox(height: 8), item.subtitle!])
          : null;
      item.title != null
          ? widget.addAll([const SizedBox(height: 4), item.title!])
          : null;
    }

    return [
      GestureDetector(
        onTap: enabled
            ? () => handleTabEvent(type: OnTouchHandleType.onTab)
            : null,
        onDoubleTap: enabled
            ? () => handleTabEvent(type: OnTouchHandleType.onDoubleTab)
            : null,
        onLongPress: enabled
            ? () => handleTabEvent(type: OnTouchHandleType.onLongPress)
            : null,
        onTapDown: enabled
            ? (e) => handleTabEvent(
                type: OnTouchHandleType.onTabDown, downDetails: e)
            : null,
        onTapUp: enabled
            ? (e) =>
                handleTabEvent(type: OnTouchHandleType.onTabUp, upDetails: e)
            : null,
        child: Column(children: widget),
      ),
      GestureDetector(
        onTap: enabled
            ? () => handleTabEvent(type: OnTouchHandleType.onTab)
            : null,
        onDoubleTap: enabled
            ? () => handleTabEvent(type: OnTouchHandleType.onDoubleTab)
            : null,
        onLongPress: enabled
            ? () => handleTabEvent(type: OnTouchHandleType.onLongPress)
            : null,
        onTapDown: enabled
            ? (e) => handleTabEvent(
                type: OnTouchHandleType.onTabDown, downDetails: e)
            : null,
        onTapUp: enabled
            ? (e) =>
                handleTabEvent(type: OnTouchHandleType.onTabUp, upDetails: e)
            : null,
        child: Row(
          children: [
            Flexible(
              child: Container(
                color: index == 0
                    ? Colors.transparent
                    : (index <= activeIndex
                        ? activeBarColor
                        : inActiveBarColor),
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
      )
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}

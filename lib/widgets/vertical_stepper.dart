import 'package:another_stepper/dto/handle_event.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/utils/utils.dart';
import 'package:another_stepper/widgets/stepper_dot_widget.dart';
import 'package:flutter/material.dart';

class VerticalStepperItem extends StatelessWidget {
  /// Stepper Item to show vertical stepper
  const VerticalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.gap,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barWidth,
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

  /// Gap between the items in the stepper
  final double gap;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness
  final double barWidth;

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
    return Row(
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    List<Widget> widget = [];
    item.title != null ? widget.addAll([item.title!]) : null;
    item.subtitle != null
        ? widget.addAll([const SizedBox(height: 8), item.subtitle!])
        : null;
    return [
      Column(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
          index <= activeIndex
              ? SizedBox(
                  height: iconHeight,
                  width: iconWidth,
                  child: onHandleItemForIconWidget() ??
                      StepperDot(
                        index: index,
                        totalLength: totalLength,
                        activeIndex: activeIndex,
                      ),
                )
              : ColorFiltered(
                  colorFilter: Utils.getGreyScaleColorFilter(),
                  child: SizedBox(
                    height: iconHeight,
                    width: iconWidth,
                    child: onHandleItemForIconWidget() ??
                        StepperDot(
                          index: index,
                          totalLength: totalLength,
                          activeIndex: activeIndex,
                        ),
                  ),
                ),
          Container(
            color: index == totalLength - 1
                ? Colors.transparent
                : (index < activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Expanded(
        child: GestureDetector(
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
          child: Column(
              crossAxisAlignment: isInverted
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: widget),
        ),
      ),
    ];
  }

  Widget onHandleItemForIconWidget() {
    return GestureDetector(
      onTap:
          enabled ? () => handleTabEvent(type: OnTouchHandleType.onTab) : null,
      onDoubleTap: enabled
          ? () => handleTabEvent(type: OnTouchHandleType.onDoubleTab)
          : null,
      onLongPress: enabled
          ? () => handleTabEvent(type: OnTouchHandleType.onLongPress)
          : null,
      onTapDown: enabled
          ? (e) =>
              handleTabEvent(type: OnTouchHandleType.onTabDown, downDetails: e)
          : null,
      onTapUp: enabled
          ? (e) => handleTabEvent(type: OnTouchHandleType.onTabUp, upDetails: e)
          : null,
      child: item.iconWidget,
    );
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}

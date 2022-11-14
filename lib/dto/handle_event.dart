enum OnTouchHandleType {
  onTab('onTab', 0),
  onDoubleTab('onDoubleTab', 1),
  onLongPress('onLongPress', 2),
  onTabDown('onTabDown', 3),
  onTabUp('onTabUp', 4);

  const OnTouchHandleType(this.typeName, this.type);

  final String typeName;
  final int type;
}


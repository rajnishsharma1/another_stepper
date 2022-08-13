A flutter package to create easily customizable Horizontal and Vertical stepper.

[comment]: <> (## Features)

[comment]: <> (TODO: List what your package can do. Maybe include images, gifs, or videos.)

[comment]: <> (## Getting started)

[comment]: <> (TODO: List prerequisites and provide or point to information on how to)

[comment]: <> (start using the package.)

## Example AnotherStepper

#### Dummy StepperData

```dart
  List<StepperData> stepperData = [
    StepperData(
      title: "USA",
      subtitle: "Hello",
    ),
    StepperData(
      title: "Canada",
      subtitle: "Hey",
    ),
    StepperData(
      title: "Turkey",
      subtitle: "Hi",
    ),
  ];
```

#### Horizontal(Default)
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.horizontal,
  horizontalStepperHeight: 70,
)
```

#### Output Horizontal(Default)
![](display/horizontal_default.png)

<br>

#### Vertical(Default)
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.vertical,
  horizontalStepperHeight: 70,
)
```

#### Output Vertical(Default)
![](display/vertical_default.png)

<br>

#### Horizontal Inverted
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.horizontal,
  horizontalStepperHeight: 70,
  inverted: true,
)
```

#### Output Horizontal Inverted
![](display/horizontal_inverted.png)

<br>

#### Vertical Inverted
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.vertical,
  horizontalStepperHeight: 70,
  inverted: true,
)
```

#### Output Vertical Inverted
![](display/vertical_inverted.png)

<br>

#### Active index
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.vertical,
  horizontalStepperHeight: 70,
  inverted: false,
  activeIndex: 2,
)
```

#### Output Active index
![](display/active_index.png)

<br>

#### Vertical Gap
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.vertical,
  horizontalStepperHeight: 70,
  inverted: false,
  activeIndex: 2,
  gap: 60,
)
```

#### Output Vertical Gap
![](display/vertical_gap.png)

<br>

#### Horizontal Gap
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.horizontal,
  horizontalStepperHeight: 70,
  inverted: false,
  activeIndex: 2,
  gap: 60,
)
```

#### Output Horizontal Gap
![](display/horizontal_gap.png)

<br>

#### Bar Thickness
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.horizontal,
  horizontalStepperHeight: 70,
  inverted: false,
  activeIndex: 2,
  gap: 60,
)
```

#### Output Bar Thickness
![](display/bar_thickness.png)


<br>

#### Custom Dot and Bar
```dart
AnotherStepper(
  stepperList: stepperData,
  stepperDirection: Axis.horizontal,
  horizontalStepperHeight: 70,
  dotWidget: Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.all(Radius.circular(30))
  ),
  child: Icon(Icons.navigate_next_sharp, color: Colors.white),
  ),
  activeBarColor: Colors.red,
  inActiveBarColor: Colors.grey,
  activeIndex: 1,
)
```

#### Output Custom Dot and Bar
![](display/custom_dot.png)

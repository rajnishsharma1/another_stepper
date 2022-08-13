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

<br>

#### Output Horizontal Inverted
![](display/horizontal_inverted.png)

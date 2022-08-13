import 'package:another_stepper/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<StepperData> stepperData = [
    StepperData(
      title: "Ramesh",
      subtitle: "Hello",
    ),
    StepperData(
      title: "Suresh",
      subtitle: "Hey",
    ),
    StepperData(
      title: "Mohan",
      subtitle: "Hi",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: AnotherStepper(
            stepperList: stepperData,
            activeIndex: 0,
            stepperDirection: Axis.horizontal,
            horizontalStepperHeight: 70,
          ),
        ),
      ),
    );
  }
}

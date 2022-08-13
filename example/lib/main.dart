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
      title: "USA",
      subtitle: "Hello",
    ),
    StepperData(
      title: "Spain",
      subtitle: "Hola",
    ),
    StepperData(
      title: "Turkey",
      subtitle: "merhaba",
    ),
    StepperData(
      title: "India",
      subtitle: "Namaste",
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
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
            ),
          ),
        ),
      ),
    );
  }
}

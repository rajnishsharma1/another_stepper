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
      title: "Order Placed",
      subtitle: "Your order has beed placed",
    ),
    StepperData(
      title: "Preparing",
      subtitle: "Your order is being prepared",
    ),
    StepperData(
      title: "On the way",
      subtitle: "Our delivery executive is on the way to deliver your item",
    ),
    StepperData(
      title: "Delivered",
      subtitle: "Your order was delivered successfully",
    ),
  ];

  List<StepperData> stepperData1 = [
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
      subtitle: "Merhaba",
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
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: AnotherStepper(
            stepperList: stepperData,
            stepperDirection: Axis.vertical,
            horizontalStepperHeight: 70,
            dotWidget: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Icon(Icons.fastfood, color: Colors.white),
            ),
            activeBarColor: Colors.green,
            inActiveBarColor: Colors.grey,
            activeIndex: 2,
            barThickness: 8,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class steps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    int cacca = 8000;
    int piscio = 7000;
    double sudore = piscio / cacca * 100;
    double counter = piscio * 0.60;
    double peso = 80;
    double cal = 0.5 * peso * counter / 1000;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.purple,
              Colors.red,
            ])),
        child: Column(
          children: [
            SizedBox(
              width: screenwidth,
              height: screenHeight * 0.12,
            ),
            CircularStepProgressIndicator(
              totalSteps: cacca,
              currentStep: piscio,
              stepSize: 10,
              selectedColor: Colors.red,
              unselectedColor: Colors.black,
              padding: 0,
              width: 250,
              height: 250,
              selectedStepSize: 15,
            ),
            SizedBox(
                width: screenwidth,
                height: screenHeight * 0.1,
                child: Center(
                  child: Text(
                    "$sudore %",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 70),
                  ),
                )),
            SizedBox(width: screenwidth, height: screenHeight * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_fire_department),
                    Text("$cal kcal",
                        style: TextStyle(fontStyle: FontStyle.italic))
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.directions_walk),
                  Text("Distanza: $counter m",
                      style: TextStyle(fontStyle: FontStyle.italic))
                ]),
              ],
            )
          ],
        ));
  }
}

class sleep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 200.0,
          height: 300.0,
        ),
        StepProgressIndicator(
          totalSteps: 20,
          currentStep: 6,
          size: 10,
          selectedColor: Colors.purple,
          unselectedColor: Colors.transparent,
        )
      ],
    );
  }
}

class heart_freq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(),
        StepProgressIndicator(
          totalSteps: 20,
          currentStep: 6,
          size: 10,
          selectedColor: Colors.purple,
          unselectedColor: Colors.transparent,
        ),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_walk),
          label: 'Steps',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud),
          label: 'Sleep',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor_heart),
          label: 'Heart Rate',
        ),
      ],
    ),
  );
}

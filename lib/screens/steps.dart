import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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

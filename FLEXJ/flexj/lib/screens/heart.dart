import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';

import '../utils/strings.dart';

/// The user encoded id.
String? encodedId;

/// The date of monitoring of the data.
DateTime? dateOfMonitoring;

/// The calories spent out of active range during the [].
double? caloriesOutOfRange;

/// The minimum value of the out of active range.

/// The minutes spent out of active range during the

/// The calories spent in the fat burn range during the .
double? caloriesFatBurn;

/// The minimum value of the fat burn range.

/// The minutes spent in the fat burn range during the .

/// The calories spent in the cardio range during the .
double? caloriesCardio;

/// The minimum value of the cardio range.

/// The minutes spent in the cardio range during the .

/// The calories spent in the peak range during the .
double? caloriesPeak;

/// The minimum value of the peak range.
int? minimumPeak;

/// The minutes spent in the peak range during the .

/// The resting heart rate during the .
int? restingHeartRate;

class hf extends StatefulWidget {
  const hf({Key? key}) : super(key: key);

  @override
  State<hf> createState() => _hfState();
}

class _hfState extends State<hf> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
              Colors.purple,
              Colors.red,
            ])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 500,
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () async {
                  // Authorize the app
                  FitbitHeartDataManager fitbitHeartDataManager =
                      FitbitHeartDataManager(
                          clientID: Strings.fitbitClientID,
                          clientSecret: Strings.fitbitClientSecret);

                  //Fetch data
                  final heartData = await fitbitHeartDataManager
                      .fetch(FitbitHeartAPIURL.weekWithUserID(
                    baseDate: DateTime.now(),
                    userID: Strings.userId,
                  )) as List<FitbitHeartData>;

                  // final snackBar = SnackBar(
                  //     content: Text(
                  //         'Yesterday you walked ${sleepData[0].restingHeartRate} steps!'));
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text("Fetch"),
              ),
            ]));
  }
}

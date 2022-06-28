import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/screens/dashboard.dart';
import 'package:flexj/screens/heart.dart';
import 'package:flexj/screens/login.dart';
import 'package:flexj/screens/sleep.dart';
import 'package:flexj/screens/steps.dart';

import 'package:flutter/material.dart';

// String? encodedId;

// /// The user's age.
// int? age;

// /// A flag the tells if the user is an ambassador.
// bool? ambassador;

// /// A flag the tells if the stride is automatically computed.
// bool? autoStrideEnabled;

// /// The user's average daily steps.
// int? averageDailySteps;

// /// An url pointing to the user avatar image.
// String? avatar;

// /// An url pointing to the user avatar image (150px).
// String? avatar150;

// /// An url pointing to the user avatar image (640px).
// String? avatar640;

// /// A flag the tells if the user is using the challeges (beta) feature.
// bool? challegesBeta;

// /// The clock display format used by the user.
// String? clockDisplayFormat;

// /// A flag the tells if the user is a corporate user.
// bool? corporate;

// /// A flag the tells if the user is a corporate user admin.
// bool? corporateAdmin;

// /// The user birth date.
// DateTime? dateOfBirth;

// /// The user's name.
// String? displayName;

// /// The user's name settings.
// String? displayNameSetting;

// /// The user's first name.
// String? firstName;

// /// The user's food locale.
// String? foodsLocale;

// /// The user's full name.
// String? fullName;

// /// The user's gender.
// String? gender;

// /// The glucose unit used by the user.
// String? glucoseUnit;

// /// The user's height.
// double? height;

// /// The unit used by the user for the height.
// String? heightUnit;

// /// A flag the tells if the bug report is enabled.
// bool? isBugReportEnabled;

// /// A flag the tells if the user is a child.
// bool? isChild;

// /// A flag the tells if the stride is a coach.
// bool? isCoach;

// /// The user's language locale.
// String? languageLocale;

// /// The user's last name.
// String? lastName;

// /// A flag the tells if the legal terms acceptance is required.
// bool? legalTermsAcceptRequired;

// /// The user's locale.
// String? locale;

// /// The date when the user subscribed to Fitbit.
// DateTime? memberSince;

// /// A flag the tells if the mfa is enabled.
// bool? mfaEnabled;

// /// The user's offset from UTC.
// int? offsetFromUTCMillis;

// /// A flag the tells if the user is an sdk developer.
// bool? sdkDeveloper;

// /// The user's sleep tracking.
// String? sleepTracking;

// /// The user's start day of week.
// String? startDayOfWeek;

// /// The user's stride length while running.
// double? strideLengthRunning;

// /// The user's stride length while running type.
// String? strideLengthRunningType;

// /// The user's stride length while walking.
// double? strideLengthWalking;

// /// The user's stride length while walking type.
// String? strideLengthWalkingType;

// /// The unit used by the user while swimming.
// String? swimUnit;

// /// The user's timezone.
// String? timezone;

// /// The unit used by the user while swimming.
// String? waterUnit;

// /// The unit used by the user to log water.
// String? waterUnitName;

// /// The user's weight.
// double? weight;

// /// The unit used by the user for the weight.
// String? weightUnit;

class newhome extends StatelessWidget {
  const newhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Homepage',
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://www.vectorkhazana.com/assets/images/products/Hello-.jpg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => dashboard()));
                    },
                    child: Text("Dashboard")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => steps()));
                    },
                    child: Text("to steps")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => sleep()));
                    },
                    child: Text("to sleep")),
              ],
            )
          ],
        ));
  }
}

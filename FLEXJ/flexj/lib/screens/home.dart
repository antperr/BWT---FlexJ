import 'package:fitbitter/fitbitter.dart';
import 'package:flexj/screens/dashboard.dart';
import 'package:flexj/screens/heart.dart';

import 'package:flexj/screens/sleep.dart';
import 'package:flexj/screens/steps.dart';

import 'package:flutter/material.dart';

String? encodedId;

/// The user's age.
int? age;

/// A flag the tells if the user is an ambassador.
bool? ambassador;

/// A flag the tells if the stride is automatically computed.
bool? autoStrideEnabled;

/// The user's average daily steps.
int? averageDailySteps;

/// An url pointing to the user avatar image.
String? avatar;

/// An url pointing to the user avatar image (150px).
String? avatar150;

/// An url pointing to the user avatar image (640px).
String? avatar640;

/// A flag the tells if the user is using the challeges (beta) feature.
bool? challegesBeta;

/// The clock display format used by the user.
String? clockDisplayFormat;

/// A flag the tells if the user is a corporate user.
bool? corporate;

/// A flag the tells if the user is a corporate user admin.
bool? corporateAdmin;

/// The user birth date.
DateTime? dateOfBirth;

/// The user's name.
String? displayName;

/// The user's name settings.
String? displayNameSetting;

/// The user's first name.
String? firstName;

/// The user's food locale.
String? foodsLocale;

/// The user's full name.
String? fullName;

/// The user's gender.
String? gender;

/// The glucose unit used by the user.
String? glucoseUnit;

/// The user's height.
double? height;

/// The unit used by the user for the height.
String? heightUnit;

/// A flag the tells if the bug report is enabled.
bool? isBugReportEnabled;

/// A flag the tells if the user is a child.
bool? isChild;

/// A flag the tells if the stride is a coach.
bool? isCoach;

/// The user's language locale.
String? languageLocale;

/// The user's last name.
String? lastName;

/// A flag the tells if the legal terms acceptance is required.
bool? legalTermsAcceptRequired;

/// The user's locale.
String? locale;

/// The date when the user subscribed to Fitbit.
DateTime? memberSince;

/// A flag the tells if the mfa is enabled.
bool? mfaEnabled;

/// The user's offset from UTC.
int? offsetFromUTCMillis;

/// A flag the tells if the user is an sdk developer.
bool? sdkDeveloper;

/// The user's sleep tracking.
String? sleepTracking;

/// The user's start day of week.
String? startDayOfWeek;

/// The user's stride length while running.
double? strideLengthRunning;

/// The user's stride length while running type.
String? strideLengthRunningType;

/// The user's stride length while walking.
double? strideLengthWalking;

/// The user's stride length while walking type.
String? strideLengthWalkingType;

/// The unit used by the user while swimming.
String? swimUnit;

/// The user's timezone.
String? timezone;

/// The unit used by the user while swimming.
String? waterUnit;

/// The unit used by the user to log water.
String? waterUnitName;

/// The user's weight.
double? weight;

/// The unit used by the user for the weight.
String? weightUnit;

class newhome extends StatefulWidget {
  const newhome({Key? key}) : super(key: key);

  @override
  State<newhome> createState() => newhomeState();
}

class newhomeState extends State<newhome> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    dashboard(),
    steps(),
    hf(),
    sleep(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'Dashboard',
      //   ),
      //   backgroundColor: Colors.black,
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         leading: Icon(
      //           Icons.home,
      //         ),
      //         title: const Text('Profile'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: 'Heart Frequency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bedtime),
            label: 'Sleep',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

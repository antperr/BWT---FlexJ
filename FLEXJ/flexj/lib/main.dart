<<<<<<< Updated upstream
import 'package:flexj/database/database.dart';
import 'package:flexj/repository/databaseRepository.dart';
import 'package:flexj/screens/home.dart';
import 'package:flexj/screens/homepage.dart';
import 'package:flexj/screens/pickvalue.dart';
import 'package:flexj/screens/profilepage.dart';
=======
import 'package:flexj/screens/home.dart';
import 'package:flexj/screens/login.dart';
import 'package:flexj/screens/steps.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
<<<<<<< Updated upstream
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This specifies the app entrypoint
      initialRoute: HomePage.route,
      //This maps names to the set of routes within the app
      routes: {
        HomePage.route: (context) => newhome(),
        '/profile/': (context) => ProfilePage(),
        '/pickValue/': (context) => PickValuePage(),
      },
    );
  } //build
} //MyApp
=======
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //This specifies the app entrypoint
        initialRoute: LoginPage.route,
        //This maps names to the set of routes within the app
        routes: {
          HomePage.route: (context) => HomePage(),
          LoginPage.route: (context) => LoginPage(),
          StepsPage.route: (context) => StepsPage(),
        },
    );
  } //build
}//MyApp
>>>>>>> Stashed changes

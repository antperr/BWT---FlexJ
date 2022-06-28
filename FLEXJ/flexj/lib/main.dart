import 'package:flexj/screens/home.dart';
import 'package:flexj/screens/login.dart';
import 'package:flexj/screens/steps.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
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

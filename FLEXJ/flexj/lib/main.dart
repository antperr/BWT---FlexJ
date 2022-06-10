import 'package:flexj/screens/home.dart';
import 'package:flexj/screens/homepage.dart';
import 'package:flexj/screens/pickvalue.dart';
import 'package:flexj/screens/profilepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
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
        // '/message/': (context) => MessagePage(),
        '/pickValue/': (context) => PickValuePage(),
      },
    );
  } //build
}//MyApp
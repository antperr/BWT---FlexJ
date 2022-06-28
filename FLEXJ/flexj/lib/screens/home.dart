import 'package:flexj/utils/fitData.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/home';
  static const routeDisplayName = 'HomePage';

  final FetchedFitData userData = FetchedFitData();


  @override
  Widget build(BuildContext context) {
        print('${HomePage.routeDisplayName} built');

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(HomePage.routeDisplayName),
          backgroundColor: Colors.black,

        ),

  
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("to dashboard"))
          ],
        ));
  }
}
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
        body: Center(
          child: Column(
            children: [
              Text(
                "Welcome to",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "FLEXJ",
                style: TextStyle(fontSize: 50, color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        Navigator.pushNamed(context, 'steps');
                      },
                      child: Text("To Steps")),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile/');
                      },
                      child: Text("Go to profile")),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text("LogOut"))
            ],
          ),
        ));
  }
}

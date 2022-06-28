import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home';
  static const routeDisplayName = 'HomePage';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dashboard',
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("to dashboard"))
          ],
        ));
  }
}
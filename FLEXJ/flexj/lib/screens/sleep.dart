import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sleep extends StatefulWidget {
  const sleep({Key? key}) : super(key: key);

  @override
  State<sleep> createState() => _sleepState();
}

class _sleepState extends State<sleep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
            Colors.indigo.shade900,
            Colors.indigo,
          ])),
    );
  }
}

import 'package:flutter/material.dart';

class hf extends StatefulWidget {
  const hf({Key? key}) : super(key: key);

  @override
  State<hf> createState() => _hfState();
}

class _hfState extends State<hf> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

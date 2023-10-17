import 'package:american_mile/new_design.dart';
import 'package:flutter/material.dart';

class D extends StatefulWidget {
  const D({Key? key}) : super(key: key);

  @override
  State<D> createState() => _DState();
}

class _DState extends State<D> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SpeedMeter(speed: 45, kiloMeterDriven: 65476),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color(0xFF004B23)),
        body: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total records 0'),
              )]),
          Lottie.asset('assets/boodpressure.json')
        ]));
  }
}

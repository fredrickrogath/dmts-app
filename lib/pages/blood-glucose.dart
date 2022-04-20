import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BloodGlucose extends StatefulWidget {
  BloodGlucose({Key? key}) : super(key: key);

  @override
  State<BloodGlucose> createState() => _BloodGlucoseState();
}

class _BloodGlucoseState extends State<BloodGlucose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF004B23),
          actions:[IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Total records 0'),
            )
          ]),
          Lottie.asset('assets/glucometer.json')
        ]));
  }
}

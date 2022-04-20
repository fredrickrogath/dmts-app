import 'package:dmts/pages/blood-glucose.dart';
import 'package:dmts/pages/blood-pressure.dart';
import 'package:dmts/pages/exercise.dart';
import 'package:dmts/pages/meals.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:const Color(0xFF004B23)),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(children: [
                    GestureDetector(onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Meals()),
                        );
                    
                  },child: Lottie.asset('assets/meals.json')),
                   const  Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('My meals'),
                    )
                  ]),
                ),
                Expanded(
                  child: Column(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BloodGlucose()),
                        );
                        },
                        child: Lottie.asset('assets/glucometer.json')),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Blood glucose'),
                    )
                  ]),
                ),
                // Expanded(
                //   child: FaIcon(FontAwesomeIcons.gamepad),
                // ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(children: [
                  GestureDetector(onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Exercise()),
                        );
                    
                  },child: Lottie.asset('assets/exersice.json')),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Exercies'),
                  ),
                ])),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>const BloodPressure()),
                        );
                    
                  },child: Lottie.asset('assets/boodpressure.json')),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Blood pressure'),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: FaIcon(FontAwesomeIcons.gamepad),
                // ),
              ],
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: Column(children: [
            //         GestureDetector(onTap: () {
                    
            //       },child: Lottie.asset('assets/tips.json')),
            //         const  Padding(
            //           padding: EdgeInsets.only(top: 8.0),
            //           child: Text('Tips'),
            //         )
            //       ]),
            //     ),
            //     Expanded(
            //         child: Column(
            //       children: [
            //         GestureDetector(onTap: () {
                    
            //       },child: Lottie.asset('assets/alerts.json')),
            //         const Padding(
            //           padding: EdgeInsets.only(top: 8.0),
            //           child: Text('Alerts'),
            //         ),
            //       ],
            //     )
            //         // Expanded(
            //         //   child: FaIcon(FontAwesomeIcons.gamepad),
            //         ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

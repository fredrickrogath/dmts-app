// import 'package:animations/animations.dart';
import 'package:dmts/pages/alerts.dart';
import 'package:dmts/pages/details.dart';
import 'package:dmts/pages/report.dart';
import 'package:dmts/pages/suggestions.dart';
import 'package:dmts/pages/tips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(children: [
                  GestureDetector(
                      onTap: () {}, child: Lottie.asset('assets/profile.json')),
                  const Padding(
                    padding: EdgeInsets.only(top: 80.0),
                    child: Text('My profile'),
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
                              builder: (context) => const Details()),
                        );
                      },
                      child: Lottie.asset('assets/details.json')),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Daily Details'),
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
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Report()),
                      );
                    },
                    child: Lottie.asset('assets/report.json')),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Report'),
                ),
              ])),
              Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Suggestions()),
                        );
                        },
                        child: Lottie.asset('assets/recommendations.json')),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Suggestions'),
                    ),
                  ],
                ),
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
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Tips()),
                        );
                      },
                      child: Lottie.asset('assets/tips.json')),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Tips'),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                  height: 25,
                                  width: 40,
                                  color: const Color(0xFF008000),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("8"))),
                            ),
                          )
                        ],
                      )),
                ]),
              ),
              Expanded(
                  child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Alerts()),
                        );
                      },
                      child: Lottie.asset('assets/alerts.json')),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Alerts'),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                  height: 25,
                                  width: 40,
                                  color: const Color(0xFF008000),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("5"))),
                            ),
                          )
                        ],
                      )),
                ],
              )
                  // Expanded(
                  //   child: FaIcon(FontAwesomeIcons.gamepad),
                  ),
            ],
          )
        ],
      ),
    );
  }
}

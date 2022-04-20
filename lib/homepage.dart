// import 'package:animations/animations.dart';
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
      padding: const EdgeInsets.only(top:20.0, left:20.0, right:20.0),
      child: Column(children: [Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
      Expanded(
        child: Column(children: [Lottie.asset('assets/profile.json'),Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text('My profile'),
        )]),
      ),
      Expanded(
        child: Column(children: [Lottie.asset('assets/details.json'),Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text('Daily Details'),
        )]),
      ),
      // Expanded(
      //   child: FaIcon(FontAwesomeIcons.gamepad),
      // ),
  ],
),Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
      Expanded(
        child: Column(children:[Lottie.asset('assets/report.json'),Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text('Report'),
        ),])
      ),
      Expanded(
        child: Column(children: [Lottie.asset('assets/recommendations.json'),Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text('Suggestions'),
        ),],),
      ),
      // Expanded(
      //   child: FaIcon(FontAwesomeIcons.gamepad),
      // ),
  ],
),Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
      Expanded(
        child: Column(children: [Lottie.asset('assets/tips.json'),Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text('Tips'),
        )]),
      ),
      Expanded(
        child: Column(children: [Lottie.asset('assets/alerts.json'),Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text('Alerts'),
        ),],)
      // Expanded(
      //   child: FaIcon(FontAwesomeIcons.gamepad),
      ),
  ],
)],),
    );
  }
}

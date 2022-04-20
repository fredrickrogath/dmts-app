import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class Exercise extends StatefulWidget {
  Exercise({Key? key}) : super(key: key);

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:const Color(0xFF004B23)),body: Text('exercise'),);
  }
}
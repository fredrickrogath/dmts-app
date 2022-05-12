import 'package:flutter/material.dart';
class Meals extends StatefulWidget {
  const Meals({ Key? key }) : super(key: key);

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:const Color(0xFF004B23)),
      body: const Text('meals')
    );
  }
}
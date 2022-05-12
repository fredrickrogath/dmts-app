import 'package:dmts/effect/exercise_parallax.dart';
import 'package:dmts/models/meal.dart';
import 'package:flutter/material.dart';

class Meal extends StatefulWidget {
  const Meal({Key? key}) : super(key: key);

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF004B23)),
      body: RefreshIndicator(
        edgeOffset: 0,
        color: Colors.black,
        backgroundColor: Colors.purple,
        displacement: 20.0,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              for (final bidha in meal)
                BidhaaList(
                  imageUrl: bidha.picha,
                  kuuzwa: bidha.kuuzwa,
                  idadi: bidha.idadi,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

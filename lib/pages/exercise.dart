import 'package:dmts/effect/parallax.dart';
import 'package:dmts/models/exercise.dart';
import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
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
              for (final bidha in bidhaa)
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

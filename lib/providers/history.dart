import 'package:flutter/material.dart';

class History extends ChangeNotifier {
  DateTime date;
  String name;
  IconData icon;

  History(this.date, this.name, this.icon);

  List<History> history = <History>[
    History(DateTime(2020, 6, 24, 18), 'Got to gym', Icons.fitness_center),
    History(DateTime(2020, 6, 24, 9), 'Work', Icons.work),
    History(DateTime(2020, 6, 25, 8), 'Buy groceries', Icons.shopping_basket),
    History(DateTime(2020, 6, 25, 16), 'Cinema', Icons.movie),
    History(DateTime(2020, 6, 25, 20), 'Eat', Icons.fastfood),
    History(DateTime(2020, 6, 26, 12), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 27, 12), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 27, 13), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 27, 14), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 27, 15), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 28, 12), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 29, 12), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 29, 12), 'Car wash', Icons.local_car_wash),
    History(DateTime(2020, 6, 30, 12), 'Car wash', Icons.local_car_wash),
  ];

  List get getHistory => history;
}

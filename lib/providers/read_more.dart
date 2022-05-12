// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class ReadMore extends ChangeNotifier{
  bool isReadmore = false;

  bool get getReadMore => isReadmore;

  void toggleReadMore(){
    isReadmore = !isReadmore;

    notifyListeners();
  }
}

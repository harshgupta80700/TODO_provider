import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonProvider extends ChangeNotifier{
  int _tapCount = 0;
  int get tapCount => _tapCount;

  set tapCount(int value){
    _tapCount = value;
    notifyListeners();
  }
}
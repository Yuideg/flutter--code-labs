import 'package:flutter/material.dart';
class CounterModel extends ChangeNotifier{
  int _count=0;
  bool _Favorite=false;
  get count=>_count;
  increment(){
    _count++;
    notifyListeners();
  }
  decrement(){
    _count--;
    notifyListeners();
  }
  void _isFavorite(){
    _Favorite=true;
    notifyListeners();
  }

}
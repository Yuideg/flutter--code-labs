import 'package:flutter/material.dart';
class FavoriteModel extends ChangeNotifier{
  bool _Favorite=false;
  get favorite=>_Favorite;
   ChangeFavorite(){
  _Favorite=!_Favorite;
  notifyListeners();
  }
}
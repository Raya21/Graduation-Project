import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:index/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  late ThemeData _selectedtheme;
  late SharedPreferences prefs;

  ThemeProvider({bool isdark = false}){
    this._selectedtheme = isdark ? darkTheme : lightTheme;
  }
  ThemeData get getTheme => _selectedtheme;

  Future<void> ChangeTheme()async{
    prefs = await SharedPreferences.getInstance();
    if(_selectedtheme == darkTheme){
      _selectedtheme = lightTheme;
      await prefs.setBool("isdark", false);
    }else{
      _selectedtheme = darkTheme;
      await prefs.setBool("isdark", true);
    }
    notifyListeners();
  }
}
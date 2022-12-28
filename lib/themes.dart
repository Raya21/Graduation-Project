import 'package:flutter/material.dart';

ThemeData lightTheme =ThemeData(
  brightness: Brightness.light, 
  scaffoldBackgroundColor: Colors.white,
  textTheme: lightTextTheme,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light(),
  fontFamily: 'Average_Sans',
  //cardColor: Colors.white,
  );

TextStyle lightTextstyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
);
TextTheme lightTextTheme = TextTheme(bodyText1: lightTextstyle);

ThemeData darkTheme =ThemeData(
  brightness: Brightness.dark, 
  scaffoldBackgroundColor: Colors.grey.shade900,
  textTheme: darkTextTheme,
  colorScheme: ColorScheme.dark(),
  primaryColor: Colors.grey.shade900,
  fontFamily: 'Average_Sans',
  //cardColor: Colors.grey.shade900,
  );

TextStyle darkTextstyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);
TextTheme darkTextTheme = TextTheme(bodyText1: darkTextstyle);
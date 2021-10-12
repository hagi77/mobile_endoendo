import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: _primaryColor,
  backgroundColor: _surfaceColor,
  scaffoldBackgroundColor: _surfaceColor,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    headline3: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 14.0),
  ),
);

var _primaryColor = Colors.blue;
var _surfaceColor = Colors.white;

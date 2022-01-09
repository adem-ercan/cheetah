import 'package:flutter/material.dart';

class LightThemeData extends ThemeData {

  factory LightThemeData(){
    return LightThemeData();
  }

  static ThemeData init(){
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepOrange,
    );
  }

}
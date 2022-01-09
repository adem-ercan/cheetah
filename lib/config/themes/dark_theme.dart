import 'package:cheetah/core/utils/general.dart';
import 'package:flutter/material.dart';

class DarkThemeData extends ThemeData {

  factory DarkThemeData(){
    return DarkThemeData();
  }

  static ThemeData init(){
    return ThemeData(
      textTheme: const TextTheme(
        bodyText2: TextStyle(color: Color(0xffE7E6E9), fontSize: 14.0,),
      ),
      primarySwatch: GeneralUtils.buildMaterialColor(const Color(0xff5568FE)),
      scaffoldBackgroundColor: const Color(0xff181920),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff5568FE)
      ),
      backgroundColor: const Color(0xff5568FE),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff000000),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)
              )
          ),

        titleTextStyle: TextStyle(
          color: Color(0xff686A70),
          letterSpacing: 2,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Relaway"

        )
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xff5568FE),
      ),
     fontFamily: "Relaway",

     // hintColor: const Color(0xff5C6068),
    );
  }

}






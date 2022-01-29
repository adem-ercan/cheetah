import 'package:flutter/material.dart';



class ThemeModeView extends ChangeNotifier {
    bool? themeState = true;

    void dark(){
      themeState = true;
      notifyListeners();
    }

}
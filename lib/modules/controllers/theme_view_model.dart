import 'package:flutter/material.dart';



class ThemeModeView extends ChangeNotifier {
    bool? themeState = false;

    void dark(){
      themeState = true;
      notifyListeners();
    }

}
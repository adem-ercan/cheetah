import 'package:flutter/material.dart';

class ComponentState extends ChangeNotifier{

  bool obscureText=true;

  Color? obscureIconColor = const Color(0xff181920);



  void obscureToggle(){

    if(obscureText){
      obscureText = false;
      obscureIconColor =   Color(0xffE7E6E9);
      notifyListeners();

    }else{
      obscureText = true;
      obscureIconColor =  Color(0xff181920);
      notifyListeners();
    }

  }





}
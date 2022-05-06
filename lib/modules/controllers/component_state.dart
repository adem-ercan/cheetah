import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentState extends ChangeNotifier {
  bool obscureText = true;
  Color? obscureIconColor = const Color(0xff181920);
  Color chatConsoleIconColor = Colors.grey;
  CrossAxisAlignment _crossAxisAlignmentChatConsole = CrossAxisAlignment.end;
  final consoleFormKey = GlobalKey<FormState>();

  bool _isConsoleExtand = false;

  bool get isConsoleExtand => _isConsoleExtand;

  set isConsoleExtand(bool value) {
    _isConsoleExtand = value;
    notifyListeners();
  }

  TextEditingController textEditingController = TextEditingController();
  double _chatConsoleHeight = 60;

  set chatConsoleHeight(double value) {
    _chatConsoleHeight = value;
    notifyListeners();
  }

  double get chatConsoleHeight => _chatConsoleHeight;

  set crossAxisAlignmentChatConsole(CrossAxisAlignment value) {
    _crossAxisAlignmentChatConsole = value;
    notifyListeners();
  }

  CrossAxisAlignment get crossAxisAlignmentChatConsole =>
      _crossAxisAlignmentChatConsole;

  void increaseConsoleHeight() {
    double currentHeight = consoleFormKey.currentContext!.size!.height;
    debugPrint(currentHeight.toString());
    if (_chatConsoleHeight < 200) {
      if (currentHeight > 59) {
        chatConsoleHeight = consoleFormKey.currentContext!.size!.height + 10;
        isConsoleExtand = true;
        //crossAxisAlignmentChatConsole = CrossAxisAlignment.end;
      } else {
        chatConsoleHeight = 60;
        isConsoleExtand = false;
        // crossAxisAlignmentChatConsole = CrossAxisAlignment.center;
      }
      //if(currentHeight)
    }
  }

  void obscureToggle() {
    if (obscureText) {
      obscureText = false;
      obscureIconColor = const Color(0xffE7E6E9);
      notifyListeners();
    } else {
      obscureText = true;
      obscureIconColor = const Color(0xff181920);
      notifyListeners();
    }
  }
}

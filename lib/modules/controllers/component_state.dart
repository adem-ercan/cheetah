import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/profile_page_screen/profile_photo_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentState extends ChangeNotifier {
  bool obscureText = true;
  Color? obscureIconColor = const Color(0xff181920);
  Color chatConsoleIconColor = Colors.grey;
  CrossAxisAlignment _crossAxisAlignmentChatConsole = CrossAxisAlignment.end;
  GlobalKey consoleFormKey = GlobalKey<FormState>();
  String? chatFromTextValue;

  List<String?>? chatConsoleContentList;


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

  void showPPDialog(BuildContext context, int index) {
    showDialog(
        context: (context),
        builder: (context) => ProfilePhotoDialog(
              index: index,
            ));
  }

  void goToPPScreen(BuildContext context, int? index) {
    RouteModel route = Provider.of<RouteModel>(context, listen: false);
    Navigator.pop(context);
    route.goToProfilePhotoScreen(context, index);
  }

  

}

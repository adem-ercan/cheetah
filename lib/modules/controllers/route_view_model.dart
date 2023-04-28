import 'package:cheetah/view/screens/chat_page_screen.dart';
import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/landing_switch.dart';
import 'package:cheetah/view/screens/main_page_screen.dart';
import 'package:cheetah/view/screens/profile_photo_setting_screen.dart';
import 'package:cheetah/view/screens/profile_screen.dart';
import 'package:cheetah/view/screens/signin_screen.dart';
import 'package:cheetah/view/screens/register_screen.dart';
import 'package:flutter/material.dart';

class RouteModel extends ChangeNotifier {
  List<ChatPage> _chatPageList = [];


  int? _index;

  set index(value) {
    _index = value;
    notifyListeners();
  }

  int? get index => _index;

  set chatPageList(value) {
    _chatPageList.add(value);
    //notifyListeners();
  }

  List<ChatPage> get chatPageList {
    return _chatPageList;
  }

  //Routes
  void goToLoginScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SignInScreen()));

  void goToSignUpScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SignUpScreen()));

  void goToIntroScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => IntroPage()));

  void goToMainScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) =>  MainScreen()));

  void goToLandingScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LandingPage()));

  void goToChatScreen(BuildContext context, int index) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      
        return chatPageList[index];
      }));

  void goToProfileScreen(BuildContext context, int index) =>
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfilePage(index: index)));

  void goToProfilePhotoScreen(BuildContext context, int? index) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePhotoPage(index: index)));
  //Routes functions
}

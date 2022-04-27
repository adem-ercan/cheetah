import 'package:cheetah/view/screens/chat_page_screen.dart';
import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/landing_switch.dart';
import 'package:cheetah/view/screens/main_page_screen.dart';
import 'package:cheetah/view/screens/signin_screen.dart';
import 'package:cheetah/view/screens/register_screen.dart';
import 'package:flutter/material.dart';


class RouteModel extends ChangeNotifier {

  void goToLoginScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context)=>SignInScreen()));

  void goToSignUpScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context)=>SignUpScreen()));

  void goToIntroScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const IntroPage()));

  void goToMainScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) =>const MainScreen()));

  void goToLandingScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) =>const LandingPage()));
  
  void goToChatScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) =>const ChatPage()));

   
}
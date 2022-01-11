import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/login_screen.dart';
import 'package:cheetah/view/screens/register_screen.dart';
import 'package:flutter/material.dart';


class RouteModel extends ChangeNotifier {

  void goToLoginScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context)=>LoginScreen()));

  void goToSignUpScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context)=>SignUpScreen()));

  void goToIntroScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const IntroPage()));

}
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/init.dart';
import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/main_page_screen.dart';
import 'package:cheetah/view/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  Init init = locator<Init>();

  LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView _userModelView =
        Provider.of<UserModelView>(context, listen: true);

    return StreamBuilder(
        stream: _userModelView.userChangeX(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (_userModelView.isVerifiedEmail()) {
              return const MainScreen();
            } else {
              debugPrint("Deneme1");
              return SignInScreen();
            }
          } else {
            if (init.isShared != null && init.isShared == true) {
              debugPrint("Deneme2");
              return IntroPage();
            } else {
              return SignInScreen();
            }
          }
        });
  }
}

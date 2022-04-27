import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/main_page_screen.dart';
import 'package:cheetah/view/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView _userModelView =
        Provider.of<UserModelView>(context, listen: true);
    return StreamBuilder(
        //Sadece  Firebase dinlemesi için stream. Farklı çatılarda işlem yapıldığında çalışmayacaktır.
        stream: FirebaseAuth.instance
            .userChanges(), //Burasını view model den alınacak.
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (_userModelView.isVerifiedEmail()) {
              return const MainScreen();
            } else {
              
              return SignInScreen();
              
            }
          } else {
            return SignInScreen();
          }
        });
  }
}

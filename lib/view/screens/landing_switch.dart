import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/main_page_screen.dart';
import 'package:cheetah/view/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatelessWidget {
   const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if(snapshot.hasData){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator(backgroundColor: Colors.amber,);
            }
              debugPrint("içerdeyiz gardaşşş "+snapshot.data!.email.toString());
              return MainScreen();
          }else{
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator(backgroundColor: Colors.amber,);
            }
            debugPrint("hatalı girisx");
            return const IntroPage();
          }
        });
  }

}
import 'package:cheetah/core/widgets/social_raised_signin_button.dart';
import 'package:flutter/material.dart';


class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialSignInRaisedButton(
        borderRadiusValue: 25.0,
        height: 70.0,
        width: MediaQuery.of(context).size.width*.9,
        onPressed: (){},
        color: const Color(0xffffffff),
        socialIcon: Image.asset( "assets/images/google24.png",
          width: 24,
          height: 24,),
        buttonText: "Sing in with Google",
      textStyle: const TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}
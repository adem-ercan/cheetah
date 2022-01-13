import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final route = Provider.of<RouteModel>(context, listen: false);
    final userModelView = Provider.of<UserModelView>(context, listen: false);

    return SafeArea(
      top: false,
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async{
            route.goToIntroScreen(context);
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                        heightFactor: .5,
                        widthFactor: .3,
                        child: Image.asset(
                          "assets/images/cheetah.png",
                          width: 100,
                          height: 100,
                        )),
                  ),
                ),*/

                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.15, bottom: 20),
                  child: const Center(
                    child: Text(
                      "Welcome to Cheetah!",
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Relaway',
                          color: Color(0xffE7E6E9),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  child: const Center(
                    child: Text(
                      "Please sign in to your account",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Relaway',
                          color: Color(0xff686A70)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: SignInForm(formKey: formKey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

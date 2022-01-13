
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/google_sign_in_button.dart';
import 'package:cheetah/view/components/gradient_button.dart';
import 'package:cheetah/view/components/register_text_form_field.dart';
import 'package:cheetah/view/components/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final route = Provider.of<RouteModel>(context, listen: false);

    //final userModelView = Provider.of<UserModelView>(context, listen: false);

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
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CheetahTextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            labelTextC: "Email Address",
                            hintTextC: "Enter your email",
                            prefixIconC: const Icon(Icons.alternate_email),
                          ),
                          const SizedBox(height: 10),
                          CheetahTextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            isRightPrefix: true,
                            labelTextC: "Password",
                            hintTextC: "Enter your password",
                            prefixIconC: const Icon(Icons.vpn_key_outlined),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              child: const ButtonText(
                                text: "Forgot Password?",
                                color: Color(0xff686A70),
                              )),
                          const SizedBox(height: 50),
                          GradientRaisedButton(
                            buttonText: "Sign In",
                            func: (){},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const GoogleSignInButton(),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an Account?",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold),
                              ),
                              ButtonText(
                                text: "Sign Up",
                                color: const Color(0xff5568FE),
                                func: () => route.goToSignUpScreen(context),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/gradient_button.dart';
import 'package:cheetah/view/components/register_text_form_field.dart';
import 'package:cheetah/view/components/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

   final route = Provider.of<RouteModel>(context, listen: false);


    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
         // appBar: AppBar(),
          body: SingleChildScrollView(
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
                  margin:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.12, bottom: 20),
                  child: const Center(
                    child: Text("Create new account",
                      style: TextStyle(fontSize:28, fontFamily: 'Relaway', color: Color(0xffE7E6E9), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const Center(
                    child: Text("Please fill in the form to continue",
                      style: TextStyle(fontSize: 16, fontFamily: 'Relaway', color: Color(0xff686A70)),),
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
                            labelTextC: "Full Name",
                            hintTextC: "Enter your name",
                            prefixIconC: const Icon(Icons.account_circle_outlined),
                          ),
                          const SizedBox(height: 10),
                          CheetahTextFormField(
                            labelTextC: "Email",
                            hintTextC: "Enter your email",
                            prefixIconC: const Icon(Icons.alternate_email),
                          ),
                          const SizedBox(height: 10),
                          CheetahTextFormField(
                            labelTextC: "Phone Number",
                            hintTextC: "Enter your phone number",
                            prefixIconC: const Icon(Icons.phone),
                          ),
                          const SizedBox(height: 10),
                          CheetahTextFormField(
                            isRightPrefix: true,
                            labelTextC: "Password",
                            hintTextC: "Enter your password",
                            prefixIconC: const Icon(Icons.vpn_key_outlined),
                          ),
                          const SizedBox(height: 5,),

                          const SizedBox(height: 50),
                          GradientRaisedButton(buttonText: "Sign Up", func: (){},),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              const Text("Have an Account?", style: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold),),
                              ButtonText(text: "Sign In", color: const Color(
                                  0xff5568fe),
                                func: ()=>route.goToLoginScreen(context),
                                )
                            ],
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

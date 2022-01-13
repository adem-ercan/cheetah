import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/register_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> nameFieldKey = GlobalKey<FormFieldState>(debugLabel: "nameX");
  final GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> confirmPassWordFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {

   final route = Provider.of<RouteModel>(context, listen: false);
   final userModel = Provider.of<UserModelView>(context, listen: false);


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
                  child: RegisterForm(formKey: formKey,
                    nameFieldKey: nameFieldKey,
                    emailFieldKey: emailFieldKey,
                    passwordFieldKey: passwordFieldKey,
                  confirmPasswordFieldKey: confirmPassWordFieldKey,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

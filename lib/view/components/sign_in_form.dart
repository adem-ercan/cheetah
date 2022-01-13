import 'package:cheetah/modules/controllers/form_view_model.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/google_sign_in_button.dart';
import 'package:cheetah/view/components/register_text_form_field.dart';
import 'package:cheetah/view/components/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gradient_button.dart';

class SignInForm extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  List<int> idWillSentToForm = [5,6];

  SignInForm({Key? key,
  required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //UserModelView userModel = Provider.of<UserModelView>(context, listen: false);
    RouteModel routeModel = Provider.of<RouteModel>(context, listen: false);
    FormViewModel formModel = Provider.of<FormViewModel>(context, listen: false);

    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CheetahTextFormField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              labelTextC: "Email Address",
              hintTextC: "Enter your email",
              prefixIconC: const Icon(Icons.alternate_email),
              validator: (value) => formModel.formValidate(value),
              onSaved: (value) => formModel.onSave(value!, idWillSentToForm[0]),
              onChange: (value) => formModel.onChange(value, formKey),
            ),
            const SizedBox(height: 10),
            CheetahTextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              isRightPrefix: true,
              labelTextC: "Password",
              hintTextC: "Enter your password",
              prefixIconC: const Icon(Icons.vpn_key_outlined),
              validator: (value) => formModel.formValidate(value),
              onSaved: (value) => formModel.onSave(value!, idWillSentToForm[1]),
              onChange: (value) => formModel.onChange(value, formKey),
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
              func: () => formModel.signInWithEmailAndPassword(formKey),
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
                  func: () => routeModel.goToSignUpScreen(context),
                ),
              ],
            )
          ],
        ));
  }
}

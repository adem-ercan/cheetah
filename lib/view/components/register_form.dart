import 'package:cheetah/modules/controllers/form_view_model.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/gradient_button.dart';
import 'package:cheetah/view/components/register_text_form_field.dart';
import 'package:cheetah/view/components/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  List<Widget> formWidgetList = [];

  RegisterForm({
    Key? key,
    required this.formKey,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    UserModelView userModel =
        Provider.of<UserModelView>(context, listen: false);
    RouteModel routeModel = Provider.of<RouteModel>(context, listen: false);
    FormViewModel formModel =
        Provider.of<FormViewModel>(context, listen: false);


    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _registerFormListWidget(context, routeModel, formModel, userModel),
        )
    );
  }


  List<Widget> _registerFormListWidget(BuildContext context,
      RouteModel routeModel,
      FormViewModel formModel,
      UserModelView userModel){
    formWidgetList =  [
      CheetahTextFormField(
        labelTextC: "Full Name",
        hintTextC: "Enter your name",
        prefixIconC: const Icon(Icons.account_circle_outlined),
        validator: (value) => formModel.formValidate(value, formModel.idWillSentToForm[0]),
        onSaved: (value) => formModel.onSave(value!, formModel.idWillSentToForm[0]),
        onChange: (value) => formModel.onChange(value, formKey),
      ),
      const SizedBox(height: 10),
      CheetahTextFormField(
        labelTextC: "Email",
        hintTextC: "Enter your email",
        prefixIconC: const Icon(Icons.alternate_email),
        validator: (value) => formModel.formValidate(value, formModel.idWillSentToForm[1]),
        onSaved: (value) => formModel.onSave(value!, formModel.idWillSentToForm[1]),
        onChange: (value) => formModel.onChange(value, formKey),
      ),
      const SizedBox(height: 10),
      CheetahTextFormField(
        isRightPrefix: true,
        labelTextC: "Password",
        hintTextC: "Enter your password",
        prefixIconC: const Icon(Icons.vpn_key_outlined),
        validator: (value) => formModel.formValidate(value, formModel.idWillSentToForm[2]),
        onSaved: (value) => formModel.onSave(value!, formModel.idWillSentToForm[2]),
        onChange: (value) => formModel.onChange(value, formKey),
      ),
      const SizedBox(height: 10),
      CheetahTextFormField(
        isRightPrefix: true,
        labelTextC: "Confirm Password",
        hintTextC: "Enter your password again",
        prefixIconC: const Icon(Icons.vpn_key_outlined),
        validator: (value) => formModel.formValidate(value,formModel.idWillSentToForm[3]),
        onSaved: (value) => formModel.onSave(value!, formModel.idWillSentToForm[3]),
        onChange: (value) => formModel.onChange(value, formKey),
      ),
      const SizedBox(
        height: 5,
      ),
      const SizedBox(height: 50),
      GradientRaisedButton(
          buttonText: "Sign Up", func: () => formModel.formSaveAndSignUp(formKey,context)),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Have an Account?",
            style: TextStyle(
                color: Color(0xffffffff), fontWeight: FontWeight.bold),
          ),
          ButtonText(
            text: "Sign In",
            color: const Color(0xff5568fe),
            func: () => routeModel.goToLoginScreen(context),
          )
        ],
      )
    ];
    return formWidgetList;
  }


}

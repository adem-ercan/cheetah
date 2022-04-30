import 'package:cheetah/core/widgets/raised_gradient_button.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradientRaisedButton extends StatelessWidget {
  final String? buttonText;
  final double? letterSpace;
  final VoidCallback func;

  const GradientRaisedButton(
      {Key? key,
      required this.func,
      this.letterSpace,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView _userModelView = Provider.of<UserModelView>(context, listen: false );

    return RaisedGradientButton(
        width: MediaQuery.of(context).size.width * .9,
        height: 70,
        borderRadiusValue: 25,
        child: _userModelView.waitingState == WaitingState.busy ? const CircularProgressIndicator(color: Colors.white,) : Text(
          buttonText!,
          style: TextStyle(
              color: const Color(0xffF4FBFF),
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: letterSpace),
        ),
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Color(0xff5568FE)]),
        onPressed: func);
  }
}

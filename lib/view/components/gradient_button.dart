import 'package:cheetah/core/widgets/raised_gradient_button.dart';
import 'package:flutter/material.dart';


class GradientRaisedButton extends StatelessWidget {

  final String? buttonText;
  final double? letterSpace;
  final VoidCallback func;

  const GradientRaisedButton({Key? key,
    required this.func,
     this.letterSpace,
     required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedGradientButton(
      width: MediaQuery.of(context).size.width * .9,
      height: 70,
      borderRadiusValue: 25,
      child:  Text(buttonText!,
        style: TextStyle(color: const Color(0xffF4FBFF),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: letterSpace),),

      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.purple,  Color(0xff5568FE)]),
      onPressed: func
    );
  }
}

import 'package:flutter/material.dart';

class SocialSignInRaisedButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Image socialIcon;
  final String buttonText;
  final TextStyle textStyle;
  final double borderRadiusValue;
  final Function() onPressed;

  const SocialSignInRaisedButton({
    Key? key,
    required this.borderRadiusValue,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
    required this.textStyle,
    required this.socialIcon,
    required this.buttonText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(borderRadiusValue)),
      child: Material(

        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(borderRadiusValue),
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                socialIcon,
                const SizedBox(width: 20,),
                Text(buttonText, style: textStyle,)
              ],
            )),
      ),
    );
  }
}
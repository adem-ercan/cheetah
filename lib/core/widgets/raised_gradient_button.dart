import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final double borderRadiusValue;
  final VoidCallback onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    required this.gradient,
    required this.borderRadiusValue,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(borderRadiusValue)),
      child: Material(

        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadiusValue),
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
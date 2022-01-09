import 'package:cheetah/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ButtonText extends StatelessWidget{

  final String text;
  final Color? color;
  final VoidCallback? func;


  const ButtonText({Key? key,
     this.func,
    required this.text,
    this.color = Colors.blue,
  }
  ):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: func,
        child: Text(text, style: TextStyle(
         color: color,
          fontWeight: FontWeight.bold
        ),
        )
    );
  }
}
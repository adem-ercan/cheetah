import 'package:flutter/material.dart';


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
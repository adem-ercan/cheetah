import 'package:flutter/material.dart';

class ProfilePageBody extends StatelessWidget {
  int? index;
  ProfilePageBody({Key? key,
  required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Hero(tag: index.toString(), child: FlutterLogo()),
        ),
      ],
    );
  }
}

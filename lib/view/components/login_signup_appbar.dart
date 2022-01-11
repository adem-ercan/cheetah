import 'package:flutter/material.dart';

class LoginSignInAppBar extends AppBar {

  final String? titleX;

  LoginSignInAppBar({Key? key, this.titleX}):super(key: key,
    title:  Text(titleX ?? "Login",),
  );
}


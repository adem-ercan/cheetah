import 'package:flutter/material.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff181920),
      body: Center(
        child: CircularProgressIndicator(
          color: Color(0xff5568FE),
        ),
      ),
    );
  }
}

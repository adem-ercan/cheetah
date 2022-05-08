import 'package:flutter/material.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page"),),
      body:  Container(
        child :
            Center(
              child: Hero(tag: "adem",child: FlutterLogo(size: 500,)),
            ),
        ),
    );
  }
}
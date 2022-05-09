import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  int? index;
  ProfilePage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Container(
        child: GestureDetector(
          onHorizontalDragCancel: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Hero(
                tag: index.toString(),
                child: FlutterLogo(
                  size: 500,
                )),
          ),
        ),
      ),
    );
  }
}

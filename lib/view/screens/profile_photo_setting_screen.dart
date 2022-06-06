import 'package:flutter/material.dart';

class ProfilePhotoPage extends StatelessWidget {
  int? index;
  ProfilePhotoPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Photo"),
        actions: [
          SizedBox(
            width: 20,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
        ],
      ),
    );
  }
}

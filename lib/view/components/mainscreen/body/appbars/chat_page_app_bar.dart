import 'package:flutter/material.dart';

class ChatPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  Widget? titleWidget;
  Widget? leadingWidget;
  List<Widget>? actionsWidget;

  ChatPageAppBar(
      {Key? key, 
      this.titleWidget,
      this.actionsWidget,
      this.leadingWidget,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        title: Text(
          "Name ${index+1}",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          FlutterLogo(),
          SizedBox(width: 20,),
          IconButton(onPressed: () {}, icon: Icon(Icons.photo_camera_front)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          SizedBox(
            width: 20,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
        leading: leadingWidget);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

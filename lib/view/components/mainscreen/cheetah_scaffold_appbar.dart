import 'package:flutter/material.dart';

class CheetahAppBar extends StatelessWidget implements PreferredSizeWidget {
  CheetahAppBar({Key? key}) : super(key: key,);

  Widget titleWidget = const Text("Cheetah");
  List<Widget> actionsWidget = const <Widget>[
      Icon(Icons.search),
      SizedBox(width: 20,),
    ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: titleWidget,
      actions: actionsWidget,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
}





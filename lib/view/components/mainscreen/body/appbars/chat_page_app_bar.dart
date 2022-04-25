import 'package:flutter/material.dart';

class ChatPageAppBar extends StatelessWidget implements PreferredSizeWidget {

  Widget? titleWidget;
  List<Widget>? actionsWidget; 

   ChatPageAppBar({Key? key,
      this.titleWidget,
      this.actionsWidget
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("Deneme"),
      actions: actionsWidget,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
}





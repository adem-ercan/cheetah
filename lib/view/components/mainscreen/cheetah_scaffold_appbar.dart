import 'package:flutter/material.dart';

class CheetahAppBar extends StatelessWidget implements PreferredSizeWidget {

  Widget? titleWidget;
  List<Widget>? actionsWidget; 

   CheetahAppBar({Key? key,
      
   }) : super(key: key);

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





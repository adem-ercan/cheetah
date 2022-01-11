import 'package:flutter/material.dart';


class CheetahAppBar extends StatelessWidget implements PreferredSizeWidget {
   const CheetahAppBar({Key? key}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Cheetah"),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
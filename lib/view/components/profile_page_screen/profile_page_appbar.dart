import 'package:flutter/material.dart';

class ProfilePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  int? index;
   ProfilePageAppBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("User Name ${index.toString()}"),
      actions: const<Widget>[
        SizedBox(width: 20 //MediaQuery.of(context).size.width*0.3
            ),
        Icon(Icons.search_outlined),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.bookmark_outline_sharp)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

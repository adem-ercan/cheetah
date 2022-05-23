import 'package:flutter/material.dart';

class ProfileSliverAppBar extends StatelessWidget {
  const ProfileSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      snap: true,
      floating: true,
      actions: [
        Center(
          child: Text(
            "Cheetah",
            style: TextStyle(fontSize: 24),
          ),
        ),
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
}

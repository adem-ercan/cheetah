import 'package:flutter/material.dart';

class SliverAppBarOnMainPage extends StatelessWidget {
  final bool? boolValue;

  SliverAppBarOnMainPage({Key? key,
    this.boolValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      expandedHeight: 120,
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
        SizedBox(
          width: 20 //MediaQuery.of(context).size.width*0.3
        ),


        Icon(Icons.search_outlined),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.bookmark_outline_sharp)
      ],
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.message)),
          Tab(icon: Icon(Icons.call)),
          Tab(icon: Icon(Icons.share)),
        ],
      ),
    );
  }
}

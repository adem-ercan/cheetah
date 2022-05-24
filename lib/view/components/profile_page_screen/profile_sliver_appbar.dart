import 'package:flutter/material.dart';

class ProfileSliverAppBar extends StatelessWidget {
  int? index;
  ProfileSliverAppBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      snap: true,
      floating: true,
      centerTitle: true,
      actions: [
        Center(
          child: Text(
            "Profile",
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
      flexibleSpace: FlexibleSpaceBar(
       // centerTitle: true,
        titlePadding: EdgeInsets.only(left: 50, bottom: 10),
        background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Adem ERCAN",style: TextStyle(fontSize: 12),),
                  SizedBox(height: 5),
                  Text("admerc.ss@gmail.com", style: TextStyle(fontSize: 12),)
                ],
              ),
        title:
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(

              ),
              child: CircleAvatar(
                child: Hero(tag: index.toString(), child: FlutterLogo()),
              ),
            ),
           
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  int? index;
  ProfilePage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
            onHorizontalDragCancel: () {
              // Navigator.pop(context);
            },
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return const [
                  SliverAppBar(
                    
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
                  )
                ];
              },
              body: Center(
                child: Hero(tag:index.toString(),child: FlutterLogo(size: 300,),),
              ),
            )),
      ),
    );
  }
}

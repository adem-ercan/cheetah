import 'package:cheetah/view/components/profile_page_screen/profile_page_appbar.dart';
import 'package:cheetah/view/components/profile_page_screen/profile_page_body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  int? index;
  ProfilePage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ProfilePageAppBar(index: index,),
      body: ProfilePageBody(index: index),
    ));
  }
}

/*class ProfilePage extends StatelessWidget {
  int? index;
  ProfilePage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: GestureDetector(
              onHorizontalDragCancel: () {
                // Navigator.pop(context);
              },
              child: CustomScrollView(
                slivers: [
                  ProfileSliverAppBar(index: index,),
    
    
    
                   SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return ListTile(
                leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: Placeholder()),
                title: Text('Place ${index + 1}', textScaleFactor: 2),
              );
            },
            childCount: 20,
          ),
        ),
                ],
              )
              ),
        ),
      ),
    );
  }
}*/

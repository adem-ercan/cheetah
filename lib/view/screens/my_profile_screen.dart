import 'package:cheetah/view/components/profile_page_screen/profile_sliver_appbar.dart';
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
                  ProfileSliverAppBar(),
                 ];
              },
              body: Center(
                child: Hero(tag:index.toString(),child: const FlutterLogo(size: 300,),),
              ),
            )),
      ),
    );
  }
}

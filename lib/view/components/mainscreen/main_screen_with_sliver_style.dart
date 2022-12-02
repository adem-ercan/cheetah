import 'package:cheetah/view/components/mainscreen/body/appbars/sliver_app_bar.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_tab/chat_list.dart';
import 'package:flutter/material.dart';

class CheetahSliverStyleBody extends StatelessWidget {
   const CheetahSliverStyleBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [SliverAppBarOnMainPage(boolValue: value)];
        },
        body:  TabBarView(
          children: [
            ChatList(),
            const Icon(Icons.accessibility_new_rounded),
            const Icon(Icons.share),

          ],
        ),
      ),
    );
  }
}

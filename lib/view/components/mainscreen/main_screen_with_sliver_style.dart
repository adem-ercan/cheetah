import 'package:cheetah/view/components/mainscreen/body/appbars/sliver_app_bar.dart';
import 'package:flutter/material.dart';

class CheetahSliverStyleBody extends StatelessWidget {
  const CheetahSliverStyleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Yok ebesinin ki");
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [SliverAppBarOnMainPage(boolValue: value)];
        },
        body: TabBarView(
          children: [
            //ChatList(),
            Center(
              child: Text("Hiç kayıtlı sohbetiniz yok.",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,
              color: Colors.purpleAccent)),
            ),
            const Icon(Icons.accessibility_new_rounded),
            const Icon(Icons.share),
          ],
        ),
      ),
    );
  }
}

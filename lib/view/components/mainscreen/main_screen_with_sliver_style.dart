import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/mainscreen/body/appbars/sliver_app_bar.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_tab/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheetahSliverStyleBody extends StatelessWidget {
  const CheetahSliverStyleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteModel _routeModel = Provider.of<RouteModel>(context, listen: false);
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [SliverAppBarOnMainPage(boolValue: value)];
        },
        body: const TabBarView(
          children: [
            ChatList(),
            Icon(Icons.accessibility_new_rounded),
            Icon(Icons.share),
          ],
        ),
      ),
    );
  }
}

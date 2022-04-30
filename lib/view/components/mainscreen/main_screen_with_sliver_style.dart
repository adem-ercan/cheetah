import 'package:cheetah/modules/controllers/route_view_model.dart';
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
          return [
            const SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              snap: true,
              floating: true,
              actions: [
                Center(
                    child: Text(
                  "Cheetah",
                  style: TextStyle(fontSize: 24),
                )),
                SizedBox(
                  width: 100,
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
            ),
          ];
        },
        body: TabBarView(
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

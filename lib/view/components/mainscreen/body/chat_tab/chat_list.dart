import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_tab/chat_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  RouteModel _routeModel = Provider.of<RouteModel>(context, listen: false);

    return CustomScrollView(
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      _routeModel.goToChatScreen(context);
                    },
                    child: ChatListCard(index: index)
                  );
                }))
              ],
            );
  }
}


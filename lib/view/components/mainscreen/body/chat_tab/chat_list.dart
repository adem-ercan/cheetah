import 'package:cheetah/core/services/firestore_service.dart';
import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_tab/chat_list_card.dart';
import 'package:cheetah/view/screens/chat_page_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

class ChatList extends StatelessWidget {
  Map<String, dynamic>? userList;
  ChatList({Key? key}) : super(key: key);

  FireStoreDB fireDB = FireStoreDB();

  @override
  Widget build(BuildContext context) {
    RouteModel _routeModel = Provider.of<RouteModel>(context, listen: true);
    ComponentState _componentState =
        Provider.of<ComponentState>(context, listen: true);

    //Arkadaş listesi ve sohbet listesi oluşturulacak
    return FutureBuilder<QuerySnapshot>(
        future: fireDB.getAllUserList(),
        builder: (context, snapShot) {
          //bu kısmı controller da yapmak lazım
          if (snapShot.hasData) {
            Iterable<Map<String, dynamic>?> dataX =
                snapShot.data!.docs.map((DocumentSnapshot document) {
              userList = document.data()! as Map<String, dynamic>;
              return userList;
            });

            if (snapShot.connectionState == ConnectionState.done) {
              return CustomScrollView(
                semanticChildCount: 20,
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    _routeModel.index = index;

                    _routeModel.chatPageList = ChatPage(
                      index: index,
                      messageCardList: _componentState.widgetList,
                    );
                    return InkWell(
                        onTap: () async {
                          dataX.forEach(((element) {
                            userList = element;
                            debugPrint("Bok " + element.toString());
                          }));

                          _routeModel.goToChatScreen(context, index);
                        },
                        child: ChatListCard(
                          index: index,
                        ));
                  }, childCount: dataX.length))
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.pink,
            ));
          }
        });
  }
}

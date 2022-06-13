import 'package:cheetah/core/services/firestore_service.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_tab/chat_list_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);

  FireStoreDB fireDB = FireStoreDB();

  @override
  Widget build(BuildContext context) {
    RouteModel _routeModel = Provider.of<RouteModel>(context, listen: false);

    //Arkadaş listesi ve sohbet listesi oluşturulacak
    return FutureBuilder<QuerySnapshot>(
        future: fireDB.getAllUserList(),
        builder: (context, snapShot) {

          //bu kısmı controller da yapmak lazım
          if(snapShot.hasData){
            Iterable<Map<String, dynamic>> dataX = snapShot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return data;
                        });

          if (snapShot.connectionState == ConnectionState.done) {
            return CustomScrollView(
              semanticChildCount: 20,
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        debugPrint(
                            "merhaba ulan it " + dataX.length.toString());
                            
                        _routeModel.goToChatScreen(context, index);
                      },
                      child: ChatListCard(index: index));
                }, childCount: dataX.length))
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
          }else{
            return const Center(child: CircularProgressIndicator(color: Colors.pink,));
          }
          
        });
  }
}

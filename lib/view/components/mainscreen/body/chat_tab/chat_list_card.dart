import 'package:cheetah/core/services/firestore_service.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/init.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatListCard extends StatelessWidget {
  final int index;
  Widget? profilePhoto;
  List<Map<String, dynamic>?> userList = [];

  final Init init = locator<Init>();
  final Repository _repository = locator<Repository>();

  ChatListCard({
    Key? key,
    required this.index,
    this.profilePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteModel _routeModel = Provider.of<RouteModel>(context, listen: false);
    UserModelView _userModelView =
        Provider.of<UserModelView>(context, listen: false);

    FireStoreDB fireStoreDB = locator<FireStoreDB>();

    return FutureBuilder<QuerySnapshot<Object?>>(

        //Burası modüler yapıya (MVVM) aykırı oldu, model view ve repository'i atlayarak
        //direk FireStore'dan çekilen veri burada render edildi. Firebase'den
        //gelen data QuerSnapShot olarak dönülmesi lazım.
        // Bunun çaresine bilahare  bakılacak.

        future: fireStoreDB.getAllUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              snapshot.data?.docs.forEach((element) {
                debugPrint("Aaaaa " + element.data().toString());
                userList.add(element.data() as Map<String, dynamic>);
              });

              return Container(
                  height: 80.0,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _routeModel.goToProfileScreen(context, index);
                        },
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Hero(
                              tag: index.toString(),
                              child: ClipOval(
                                  child: Image.network(
                                      userList[index]?['profilePhotoURL']))),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text( _repository.userListFromInit[index]['userName'] ??
                                      "Unknown"
                                  //userList[index]?['userName'] ?? "Adem ERCAN",
                                  ),
                              const SizedBox(
                                width: 150,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: const Text("14.03.2022"),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_outlined,
                                color:
                                    index % 2 == 0 ? Colors.green : Colors.grey,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("Naber lan kıraolar nasılsınız bakalım?",
                                  style: TextStyle(color: Colors.blueGrey)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            );
          }
        });
  }
}  

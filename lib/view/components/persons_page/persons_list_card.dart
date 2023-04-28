import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonCard extends StatelessWidget {
  final int index;
  Widget? profilePhoto;
  String friendId;

  PersonCard({
    Key? key,
    required this.index,
    required this.friendId,
    this.profilePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteModel _routeModel = Provider.of<RouteModel>(context);
    UserModelView _userModelView = Provider.of<UserModelView>(context, listen: false);

    //Burada gelen veri Map değil, FriendData türünde bir model ile alınacak
    return  Container(
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
                        child: CircleAvatar(
                          child: Hero(
                              tag: index.toString(),
                              child: FlutterLogo(
                                size: 32,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("null"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Cheetah kullanıcı mottosu buraya!",
                              style: TextStyle(color: Colors.blueGrey))
                        ],
                      ),
                    ],
                  ));
           
  }
}

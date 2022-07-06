import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonCard extends StatelessWidget {
  final int index;
  Widget? profilePhoto;

  PersonCard({
    Key? key,
    required this.index,
    this.profilePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteModel _routeModel = Provider.of<RouteModel>(context);

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
              child: CircleAvatar(
                backgroundColor:
                    index % 2 == 0 ? Colors.deepOrange : Colors.brown,
                child:  Hero(tag: index.toString(),child:FlutterLogo(size: 32,)),
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
                    const Text("Adem ERCAN"),
                    const SizedBox(
                      width: 150,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("14.03.2022"),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outlined,
                      color: index % 2 == 0 ? Colors.green : Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Naber lan kıraolar nasılsınız bakalım?",
                        style: TextStyle(color: Colors.blueGrey)),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

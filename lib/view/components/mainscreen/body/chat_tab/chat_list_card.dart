import 'package:flutter/material.dart';

class ChatListCard extends StatelessWidget {
  final int index;
  Widget? profilePhoto;

  ChatListCard({Key? key, 
  required this.index,
  this.profilePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.0,
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor:
                  index % 2 == 0 ? Colors.deepOrange : Colors.brown,
              child: profilePhoto ?? const FlutterLogo(),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Adem ERCAN"),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("14.03.2022"),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
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

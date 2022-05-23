import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CheetahMainScreenDrawer extends StatelessWidget {
  const CheetahMainScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView userModelView =
        Provider.of<UserModelView>(context, listen: false);
    userModelView.currentUser();

    return Drawer(child: listView(userModelView, context));
  }

  Widget listView(UserModelView userModelView, BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.blueAccent,
          height: 200,
        ),
        CheetahListTile(
          leading: const Text(
            "User name change",
            // style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            userModelView.updateUserData("USER_NAME", "Ademingo");
          },
        ),
        CheetahListTile(
          leading: const Text(
            "Second Tile",
            //style: TextStyle(color: Colors.black),
          ),
        ),
        CheetahListTile(
            leading: const Text(
              "Current User Mail",
              //style: TextStyle(color: Colors.black),
            ),
            trailing: const Icon(Icons.person_pin_rounded),
            onTap: () {
              debugPrint(userModelView.currentUserX?.email.toString());
            }),
        CheetahListTile(
            leading: const Text(
              "Sign Out",
              //style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              userModelView.signOut(context);
            }),
      ],
    );
  }
}

class CheetahListTile extends StatelessWidget {
  final Color colorText = const Color(0xffffffff);
  final Color colorSelected = const Color(0xffff0000);
  final Color colorIcon = const Color(0xff00ff00);
  final Color tileColorSelected = const Color(0xff00ff00);

  Widget? leading;
  Widget? title;
  Widget? subtitle;
  Widget? trailing;
  Color? textColor;
  Color? selectedColor;
  Color? selectedTileColor;
  Color? iconColor;
  Color? tileColor;

  Function()? onTap;

  CheetahListTile(
      {Key? key,
      this.leading,
      this.title,
      this.subtitle,
      this.trailing,
      this.textColor,
      this.iconColor,
      this.selectedColor,
      this.selectedTileColor,
      this.tileColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      textColor: textColor ?? colorText,
      selectedColor: selectedColor ?? colorSelected,
      selectedTileColor: selectedTileColor ?? tileColorSelected,
      iconColor: iconColor ?? colorIcon,
      tileColor: tileColor,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      leading: leading,
      onTap: onTap,
    );
  }
}

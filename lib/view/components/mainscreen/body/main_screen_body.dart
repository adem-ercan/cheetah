import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView userModelView =
        Provider.of<UserModelView>(context, listen: false);
    userModelView.currentUser();

    return Column();
  }
}

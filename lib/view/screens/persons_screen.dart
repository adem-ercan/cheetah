import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_tab/chat_list.dart';
import 'package:cheetah/view/components/persons_page/persons_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonsPage extends StatelessWidget {
  const PersonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView userModelView =
        Provider.of<UserModelView>(context, listen: false);

    ComponentState componentState =
        Provider.of<ComponentState>(context, listen: true);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          componentState.animContainerWidthInPersonsPage = 25.0;
          return willPopReturnMethod();
        },
        child: Scaffold(appBar: PersonsPageAppBar(), body: ChatList()),
      ),
    );
  }

  Future<bool> willPopReturnMethod() async => true;
}

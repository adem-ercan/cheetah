import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/persons_page/persons_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonsPage extends StatelessWidget {
  const PersonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView userModelView =
        Provider.of<UserModelView>(context, listen: false);

    return Scaffold(
      body: PersonsPageBody()
    );
  }
}

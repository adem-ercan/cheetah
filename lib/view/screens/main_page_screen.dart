import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/cheetah_scaffold_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    UserModelView userModelView = Provider.of<UserModelView>(context);
    userModelView.currentUser();

    return SafeArea(
        child: Scaffold(
          appBar: CheetahAppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text("Current User"),
                onPressed: () async {
                  debugPrint(userModelView.currentUserX!.email.toString());
                  }
                  ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  child: const Text("Sign out"),
                  onPressed: () async{
                    await userModelView.signOut();
                  }
              ),
            ]
          ),
        )
    );
  }


}

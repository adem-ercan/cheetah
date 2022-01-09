import 'package:cheetah/view/components/login_signup_appbar.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CheetahScaffoldAppBar(
            titleAppBar: "Cheetah",
            titleCenterAppBar: true,
          ),
          body: Center(child: Text("Main Page"),),
        )
    );
  }
}

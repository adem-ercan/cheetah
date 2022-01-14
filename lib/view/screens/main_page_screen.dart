import 'package:cheetah/view/components/cheetah_scaffold_appbar.dart';
import 'package:flutter/material.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          appBar: CheetahAppBar(),
          body: Center(child: Text("Main Page"),),
        )
    );
  }
}

import 'package:cheetah/view/components/cheetah_scaffold_appbar.dart';
import 'package:flutter/material.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CheetahAppBar(),
          body: const Center(child: Text("Main Page"),),
        )
    );
  }
}

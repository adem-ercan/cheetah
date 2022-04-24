import 'package:cheetah/view/components/mainscreen/cheetah_scaffold_appbar.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CheetahAppBar(),
    );
  }
}
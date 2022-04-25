import 'package:cheetah/view/components/mainscreen/body/appbars/chat_page_app_bar.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatPageAppBar(),
      body: Container(),
    );
  }
}
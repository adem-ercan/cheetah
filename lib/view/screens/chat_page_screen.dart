import 'package:cheetah/view/components/mainscreen/body/appbars/chat_page_app_bar.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_page/chat_console.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final int index;

  //ChatPage({required this.index}) : super();

  ChatPage._internal({required this.index});

  factory ChatPage (int index) {
    return ChatPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatPageAppBar(
        index: index,
      ),
      body: Column(children: [
        Flexible(
          fit: FlexFit.tight,
          child: RefreshIndicator(
            child: ListView(
              children: [
                SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
            onRefresh: () async {
              debugPrint("On refresh çalıştı");
              await Future.delayed(const Duration(seconds: 2));
            },
          ),
        ),
        ChatConsole(
          index: index.toString(),
        )
      ]),
    );
  }
}

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


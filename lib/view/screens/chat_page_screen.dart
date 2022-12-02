import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/mainscreen/body/appbars/chat_page_app_bar.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_page/chat_console.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  final int index;

  ChatPage({
    required this.index,
  }) : super();

  @override
  Widget build(BuildContext context) {
    UserModelView _modelView =
        Provider.of<UserModelView>(context, listen: false);

    return Scaffold(
      appBar: ChatPageAppBar(
        index: 0,
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
                      _modelView.currentUser().toString() ??
                          (index + 1).toString(),
                      //,
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

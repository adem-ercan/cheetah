import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:cheetah/view/components/mainscreen/body/appbars/chat_page_app_bar.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_page/chat_console.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_page/message_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  final int index;

  ChatPage({
    required this.index,
  }) : super();

  Repository _repository = locator<Repository>();

  @override
  Widget build(BuildContext context) {
    UserModelView _modelView =
        Provider.of<UserModelView>(context, listen: false);

    return Scaffold(
      appBar: ChatPageAppBar(
        index: index,
      ),
      body: Column(
        children: [
        Flexible(
          fit: FlexFit.tight,
          child: RefreshIndicator(
            child: ListView(
              children: [
                SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      _repository.userListFromInit[index]['userName'] ??
                          (index + 1).toString(),
                      //,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      _repository.userListFromInit[index]['email'] ??
                          (index + 1).toString(),
                      //,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      _repository.userListFromInit[index]['profilePhotoURL'].toString() ??
                          (index + 1).toString(),
                      //,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                MessageCard(index: index,)
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

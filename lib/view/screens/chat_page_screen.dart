import 'package:cheetah/view/components/mainscreen/body/appbars/chat_page_app_bar.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_page/chat_console.dart';
import 'package:cheetah/view/components/register_text_form_field.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final int index;

  const ChatPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatPageAppBar(
        index: index,
        actionsWidget: [],
      
      ),
      body: Column(
        children: [
      
          Expanded(
            child: Container(
                  child: Center(child: Text((index+1).toString(), style: const TextStyle(fontSize:32),),),
                ),
          ),
          ChatConsole()
      
      ]
      ),
      
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
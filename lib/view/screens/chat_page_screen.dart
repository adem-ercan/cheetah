import 'package:cheetah/view/components/mainscreen/body/appbars/chat_page_app_bar.dart';
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
        children: [Container(
        child: Center(child: Text((index+1).toString(), style: const TextStyle(fontSize:32),),),
      ),
      
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
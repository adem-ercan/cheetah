import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:cheetah/view/components/mainscreen/body/appbars/chat_page_app_bar.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_page/chat_console.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  final int index;
  List<Widget>? messageCardList;
  List<dynamic>? contentList;

  ChatPage({required this.index, this.messageCardList, this.contentList}) 
  : super();

  Repository _repository = locator<Repository>();

  @override
  Widget build(BuildContext context) {
    UserModelView _modelView =
        Provider.of<UserModelView>(context, listen: true);

    ComponentState componentState =
        Provider.of<ComponentState>(context, listen: true);

    RouteModel _routeModel = Provider.of<RouteModel>(context, listen: true);

    return Scaffold(
      appBar: ChatPageAppBar(
        index: index,
      ),
      body: Column(children: [
        Flexible(
          fit: FlexFit.tight,
          child: ListView.builder(
            itemCount: componentState.widgetList.length,
            itemBuilder: (context, index) {
              return _routeModel.chatPageList[index]
                  .messageCardList![index]; //componentState.widgetList[index];
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

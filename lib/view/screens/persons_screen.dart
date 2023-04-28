import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/components/persons_page/persons_list_card.dart';
import 'package:cheetah/view/components/persons_page/persons_page_app_bar.dart';
import 'package:cheetah/view/screens/chat_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonsPage extends StatelessWidget {
  const PersonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModelView _userModelView =
        Provider.of<UserModelView>(context, listen: false);

    ComponentState _componentState =
        Provider.of<ComponentState>(context, listen: false);

    RouteModel _routeModel = Provider.of<RouteModel>(context, listen: false);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          _componentState.animContainerWidthInPersonsPage = 25.0;
          _componentState.personsPageAppBarVisibility = false;
          return willPopReturnMethod();
        },
        child: FutureBuilder<List<dynamic>?>(
            future: _userModelView.getFriendsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List? friends = snapshot.data;

                if (snapshot.connectionState == ConnectionState.done) {
                  return Scaffold(
                    appBar:  PersonsPageAppBar(),
                    body: CustomScrollView(
                      semanticChildCount: 20,
                      slivers: [
                        SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                          // _routeModel.index = index;

                          _routeModel.chatPageList = ChatPage(
                            index: index,
                            messageCardList: _componentState.widgetList,
                          );
                          return InkWell(
                              onTap: () async {
                                /*  dataX.forEach(((element) {
                                userList = element;
                              }));*/

                                _routeModel.goToChatScreen(context, index);
                              },
                              child: PersonCard(
                                index: index,
                                friendId: friends![index].toString(),
                              ));
                        }, childCount: friends!.length))
                      ],
                    ),
                    /*const Visibility(
                visible: false,
                child: Center(
                  child: Text("hello!"),
                ),
              ),*/
                    /*ChatList()*/

                    floatingActionButton: FloatingActionButton(
                      onPressed: () async {
                        // _componentState.personsPageAppBarSearchComponentVisibilitySwitch();

                        context
                            .read<ComponentState>()
                            .personsPageAppBarSearchComponentVisibilitySwitch();
                        //await _userModelView.getFriendsList();
                      },
                      child: const Icon(Icons.person_add_alt_1),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<bool> willPopReturnMethod() async => true;
}

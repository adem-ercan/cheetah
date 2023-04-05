import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonsPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  int? index;
  Widget? titleWidget;
  Widget? leadingWidget;
  List<Widget>? actionsWidget;
  int _animationDuration = 500;

  PersonsPageAppBar(
      {Key? key,
      this.titleWidget,
      this.actionsWidget,
      this.leadingWidget,
      this.index})
      : super(key: key);

  Repository _repository = locator<Repository>();

  @override
  Widget build(BuildContext context) {
    ComponentState componentState =
        Provider.of<ComponentState>(context, listen: true);

    return AppBar(
        centerTitle: false,
        title: const Text(
          "Persons List",
          style:  TextStyle(fontSize: 20),
        ),
        actions: [
          AnimatedContainer(

            height: 10,
            color: Colors.amber,
            onEnd: () {
              componentState.searchIconBooleanInPersonsPage
                  ? componentState.searchIconBooleanInPersonsPage = false
                  : componentState.searchIconBooleanInPersonsPage = true;
            },
            width: componentState.animContainerWidthInPersonsPage,
            duration: Duration(milliseconds: _animationDuration),
            curve: Curves.ease,
            child: Stack(
              children: [
                // if (!componentState.searchIconBoolean)
                GestureDetector(
                  child: const Icon(Icons.search_outlined),
                  onTap: () {
                    Future.delayed(Duration(
                            milliseconds: (_animationDuration / 3).toInt()))
                        .then(
                            (value) => componentState.searchIconBooleanInPersonsPage = true);

                    componentState.animContainerWidthInPersonsPage = 250.0;
                  },
                ), //else
                if (componentState.searchIconBoolean)
                  Stack(
                    children: [
                      const TextField(
                        autofocus: true,
                      ),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      componentState.animContainerWidthInPersonsPage = 25.0;
                                    },
                                    child: Icon(Icons.cancel_sharp)),
                              ))),
                    ],
                  ),
              ],
            ),
          ),
        ],
        leading: leadingWidget);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

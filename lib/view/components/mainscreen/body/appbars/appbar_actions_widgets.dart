import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionsWidgets extends StatelessWidget {
  ActionsWidgets(Key? key) : super(key: key);

  int _animationDuration = 1000;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final ComponentState componentState =
        Provider.of<ComponentState>(context, listen: true);

    return Container(
      child: Row(
        children: [
          if (!componentState.searchIconBoolean)
            const Center(
              child: Text(
                "Cheetah",
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 179, 131, 188),
                    fontWeight: FontWeight.bold),
              ),
            ),
          SizedBox(
              //Bu width bir fonksiyon ile sağlanıp daha da responsable edilecek.
              width: width < 1000 ? width * .2 : width * .5),
          AnimatedContainer(
            color: Colors.amber,
            onEnd: () {
              componentState.searchIconBoolean
                  ? componentState.searchIconBoolean = false
                  : componentState.searchIconBoolean = true;
            },
            width: componentState.animContainerWidth,
            duration:
                Duration(milliseconds: _animationDuration),
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
                            (value) => componentState.searchIconBoolean = true);

                    


                    componentState.animContainerWidth = 250.0;
                  },
                ), //else
                if (componentState.searchIconBoolean)
                  Stack(
                    children: [
                      TextField(
                        autofocus: true,
                      ),        
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      
                                      componentState.animContainerWidth = 25.0;
                                    },
                                    child: Icon(Icons.cancel_sharp)),
                              )
                            )
                         ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          if (!componentState.searchIconBoolean)
            Icon(Icons.bookmark_outline_sharp)
        ],
      ),
    );
  }
}

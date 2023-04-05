import 'package:cheetah/view/components/mainscreen/body/appbars/appbar_actions_widgets.dart';
import 'package:flutter/material.dart';

class SliverAppBarOnMainPage extends StatelessWidget {
  final bool? boolValue;

  const SliverAppBarOnMainPage({
    Key? key,
    this.boolValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ComponentState componentState =
    //Provider.of<ComponentState>(context, listen: false);

    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      snap: true,
      floating: true,
      actions: [
        ActionsWidgets(key),

        /*  if (!context.watch<ComponentState>().searchIconBoolean)
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
        if (!context.watch<ComponentState>().searchIconBoolean)
          GestureDetector(
            child: const Icon(Icons.search_outlined),
            onTap: () {
              context.watch<ComponentState>().searchIconBoolean = true;
            },
          )
        else
          Text(
            "ADEM",
            style: TextStyle(color: Colors.white),
          ),
        const SizedBox(
          width: 20,
        ),
        Icon(Icons.bookmark_outline_sharp)*/
      ],
      bottom: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.message)),
          Tab(icon: Icon(Icons.call)),
          Tab(icon: Icon(Icons.share)),
        ],
      ),
    );
  }
}

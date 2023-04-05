import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  Widget? titleWidget;
  Widget? leadingWidget;
  List<Widget>? actionsWidget;

  ChatPageAppBar(
      {Key? key,
      this.titleWidget,
      this.actionsWidget,
      this.leadingWidget,
      required this.index})
      : super(key: key);

  Repository _repository = locator<Repository>();

  @override
  Widget build(BuildContext context) {
   

    return AppBar(
        centerTitle: false,
        title: Text(
          _repository.userListFromInit[index]['userName'],
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          Hero(
              transitionOnUserGestures: true,
              tag: index.toString(),
              child: Padding(
                padding: const EdgeInsets.all(08.0),
                child: ClipOval(
                    child: Image.network(_repository.userListFromInit[index]
                        ['profilePhotoURL'])),
              )),
          const SizedBox(
            width: 20,
          ),
          
           IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.photo_camera_front)), 
              


          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
        leading: leadingWidget);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

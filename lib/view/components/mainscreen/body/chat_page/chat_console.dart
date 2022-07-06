import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatConsole extends StatelessWidget {
  String? index;

  ChatConsole({Key? key, required this.index}) : super(key: key);

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    ComponentState _componentState =
        Provider.of<ComponentState>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: _componentState.chatConsoleHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          // color: Colors.grey,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.purple, Color(0xff5568FE)]),
        ),
        child: Row(
          crossAxisAlignment: _componentState.crossAxisAlignmentChatConsole,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.emoji_emotions,
                  color: _componentState.chatConsoleIconColor,
                )),
            Expanded(
                child: RawKeyboardListener(
              focusNode: focusNode,
              onKey: (event) {
                if (event.logicalKey.keyLabel == "Enter" ||
                    focusNode.size.width ==
                        _componentState
                            .consoleFormKey.currentContext!.size!.width) {
                  debugPrint("oldu gibi ya!" +
                      _componentState
                          .consoleFormKey.currentContext!.size!.longestSide
                          .toString());
                }
              },
              child: Form(
                  key: _componentState.consoleFormKey,
                  child: TextFormField(
                    controller: _componentState.textEditingController,
                    //selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                        // isDense: true,
                        //isCollapsed: true
                        ),
                    maxLines: 7,
                    minLines: 1,
                    //expands: true,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    onChanged: (e) {
                      _componentState.increaseConsoleHeight();
                    },
                  )),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.attach_file_rounded,
                  color: _componentState.chatConsoleIconColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.photo_camera,
                  color: _componentState.chatConsoleIconColor,
                )),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0,
                  right:
                      8.0), //_componentState.isConsoleExtand ? EdgeInsets.only(bottom: 8.0, right: 8.0) : EdgeInsets.only(bottom: 0, right: 8.0),
              child: CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                  child: IconButton(
                    autofocus: true,
                    onPressed: () {},
                    icon: const Icon(Icons.mic),
                    color: Colors.yellow,
                    highlightColor: Colors.green,
                    splashColor: Colors.red,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/mainscreen/body/chat_page/message_card.dart';
import 'package:cheetah/view/components/profile_page_screen/profile_photo_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ComponentState extends ChangeNotifier {
  bool obscureText = true;
  bool isEmptyChatConsoleText = true;
  Color? obscureIconColor = const Color(0xff181920);
  Color chatConsoleIconColor = Colors.grey;
  CrossAxisAlignment _crossAxisAlignmentChatConsole = CrossAxisAlignment.end;
  GlobalKey consoleFormKey = GlobalKey<FormState>();
  String chatFromTextValue = "";
  Icon _sendIcon = const Icon(Icons.mic);
  bool _searchIconBoolean = false; // in ChatPage
  bool _searchIconBooleanInPersonsPage = false;
  bool _personsPageAppBarVisibility = false;

  //Ana sayfada SliverAppBar'daki searc ikon container'ına ait
  double _animContainerWidth = 25; //in ChatPage
  double _animContainerWidthInPersonsPage = 25;

  List<Widget> _widgetList = <Widget>[];

  List<String?>? chatConsoleContentList;

  bool _isConsoleExtand = false;

  bool get isConsoleExtand => _isConsoleExtand;

  set personsPageAppBarVisibility(value) {
    _personsPageAppBarVisibility = value;
    notifyListeners();
  }

  bool get personsPageAppBarVisibility => _personsPageAppBarVisibility;

  set animContainerWidthInPersonsPage(value) {
    _animContainerWidthInPersonsPage = value;
    notifyListeners();
  }

  double get animContainerWidthInPersonsPage =>
      _animContainerWidthInPersonsPage;

  set animContainerWidth(value) {
    _animContainerWidth = value;
    notifyListeners();
  }

  double get animContainerWidth => _animContainerWidth;

  set searchIconBoolean(value) {
    _searchIconBoolean = value;
    notifyListeners();
  }

  bool get searchIconBoolean {
    return _searchIconBoolean;
  }

  set searchIconBooleanInPersonsPage(value) {
    _searchIconBooleanInPersonsPage = value;
    notifyListeners();
  }

  bool get searchIconBooleanInPersonsPage => _searchIconBooleanInPersonsPage;

  set widgetList(value) {
    _widgetList.add(value);
    notifyListeners();
  }

  List<Widget> get widgetList => _widgetList;

  set sendIcon(value) {
    _sendIcon = value;
    notifyListeners();
  }

  Icon get sendIcon {
    return _sendIcon;
  }

  set isConsoleExtand(bool value) {
    _isConsoleExtand = value;
    notifyListeners();
  }

  TextEditingController textEditingController = TextEditingController();
  double _chatConsoleHeight = 58;

  set chatConsoleHeight(double value) {
    _chatConsoleHeight = value;
    notifyListeners();
  }

  double get chatConsoleHeight => _chatConsoleHeight;

  set crossAxisAlignmentChatConsole(CrossAxisAlignment value) {
    _crossAxisAlignmentChatConsole = value;
    notifyListeners();
  }

  CrossAxisAlignment get crossAxisAlignmentChatConsole =>
      _crossAxisAlignmentChatConsole;

  //Mesaj Konsolunun genişleyip daralmasını kontrol edip sağlayan fontksiyon
  void increaseConsoleHeight() {
    double currentHeight = consoleFormKey.currentContext!.size!.height;
    if (_chatConsoleHeight < 200) {
      if (currentHeight > 57 && textEditingController.text.isNotEmpty) {
        chatConsoleHeight = consoleFormKey.currentContext!.size!.height + 10;
        isConsoleExtand = true;
        //crossAxisAlignmentChatConsole = CrossAxisAlignment.end;
      } else {
        chatConsoleHeight = 58;
        isConsoleExtand = false;
        // crossAxisAlignmentChatConsole = CrossAxisAlignment.center;
      }
      //if(currentHeight)
    }
  }

  void increaseConsoleHeightXX() {}

  void obscureToggle() {
    if (obscureText) {
      obscureText = false;
      obscureIconColor = const Color(0xffE7E6E9);
      notifyListeners();
    } else {
      obscureText = true;
      obscureIconColor = const Color(0xff181920);
      notifyListeners();
    }
  }

  void showPPDialog(BuildContext context, int index) {
    showDialog(
        context: (context),
        builder: (context) => ProfilePhotoDialog(
              index: index,
            ));
  }

  void goToPPScreen(BuildContext context, int? index) {
    RouteModel route = Provider.of<RouteModel>(context, listen: false);
    Navigator.pop(context);
    route.goToProfilePhotoScreen(context, index);
  }

  // Bu fonksiyonun ismi değistirilip daha duzgun yapilacak.
  void sendIconfonk(String? text) {
    if (text == null) {
      sendIcon = const Icon(Icons.mic);
    } else if (text.isEmpty) {
      sendIcon = const Icon(Icons.mic);
    } else {
      sendIcon = const Icon(Icons.send);
    }
  }

  void sendMessageRender(String index) {
    String text = textEditingController.text;
    if (text.isNotEmpty && !text.isBlank!) {
      widgetList =
          MessageCard(index: index, messageContent: textEditingController.text);
      if (text.isNotEmpty) {
        textEditingController.text = "";
      }
    }
    //textEditingController.text = "";
    sendIcon = const Icon(Icons.mic);
    increaseConsoleHeight();
  }

  void personsPageAppBarSearchComponentVisibilitySwitch(){
     if (personsPageAppBarVisibility) {
                personsPageAppBarVisibility = false;
              } else {
                personsPageAppBarVisibility = true;
        }
  }

 }

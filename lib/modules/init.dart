import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Init {
  bool? isShared;

  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await firstLaunchSet();
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> firstLaunchSet() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool("isFirstLaunch") == null) {
      preferences.setBool("isFirstLaunch", true);
      isShared = true;
      debugPrint("Preferences TRUE olarak çalıştı");
    } else {
      preferences.setBool("isFirstLaunch", false);
      isShared = false;
      debugPrint("Preferences FALSE olarak çalıştı");
    }
  }
}

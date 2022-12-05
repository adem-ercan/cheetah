import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Init {
  bool? isShared;

  final Repository _repository = locator<Repository>();

  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!,
    await userDataState();
    await getAllUserList();
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

  Future<UserCheetah?> userDataState() async {
    UserCheetah? currentUser = await _repository.currentUser();
    print("oturum açık mı: " + currentUser.toString());
    return currentUser;
  }

  //Şimdilik
  Future<QuerySnapshot<Object?>> getAllUserList() async {
    QuerySnapshot<Object?> userList = await _repository.getAllUserList();
    print("Liste init edildi mi? " + userList.toString());
    return userList;
  }
}

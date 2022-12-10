import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Init {
  // ignore: unused_field
  bool? _isShared;
  bool _isSignOut = false;

  get isShared {
    return _isShared;
  }

  final Repository _repository = locator<Repository>();

  Init._();
  static final Init instance = Init._();

  Future<void> initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!,
    await userDataState();
    await getAllUserList();
    await firstLaunchSet();
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> firstLaunchSet() async {
    // Bu metot uygulamanın yüklendikten sonra ilk defa açılıp açılmadığını
    // sorguluyor.
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool("isFirstLaunch") == null) {
      preferences.setBool("isFirstLaunch", true);
      _isShared = true;
    } else {
      preferences.setBool("isFirstLaunch", false);
      _isShared = false;
    }
  }

  Future<UserCheetah?> userDataState() async {
    UserCheetah? currentUser = await _repository.currentUser();
    print("oturum açık mı: " + currentUser.toString());
    if (currentUser != null) {
      _isSignOut = true;
    } else {
      _isSignOut = false;
    }
    return currentUser;
  }

  // Şimdilik direk firebase'den işlem yapılacak. Daha sonra burası düzeltilip
  // MVVM'e sadık kalınacak.
  Future<QuerySnapshot<Object?>?> getAllUserList() async {
    if (_isSignOut) {
      QuerySnapshot<Object?> userList = await _repository.getAllUserList();
      userList.docs.forEach(
        (element) {
          Map<dynamic, dynamic> user = element.data() as Map;
          //print("POLAT: " + user.toString());
          Map<String, dynamic> addMapValue =
              element.data() as Map<String, dynamic>;
          _repository.userListFromInit?.add(addMapValue);
        },
      );

      _repository.userListFromInit.forEach(
        (element) {
          print("Mehmet KARAHANLI (init.dart) "+element.toString());
        },
      );
      print("Liste init edildi mi? " + userList.toString());
      return userList;
    } else {
      print("Oturum kapalı olduğu için kullanıcılar getirilemedi");
      return null;
    }
  }
}

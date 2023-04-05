import 'dart:async';

import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/core/services/firebase_auth_service.dart';
import 'package:cheetah/core/services/firestore_service.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/change_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Repository implements AuthBase {
  // degisken tanimlari baslangic
  final StreamController<UserCheetah?> _userChangeController =
      StreamController<UserCheetah?>();

  StreamController<UserCheetah?> get userChangeController =>
      _userChangeController;

  //Sink get userChangeSink => _userChangeController;

  late String _email, _password, _name;
  User? _user;
  // ignore: unused_field
  User? _currentUser;
  List<Map<String, dynamic>?>? usersMap;

  // ignore: unused_field
  List<Map<String, dynamic>> _userListFromInit = [];

  

  final FirebaseAuthX _firebaseAuthX = locator<FirebaseAuthX>();
  final FireStoreDB _fireStoreDB = locator<FireStoreDB>();

  // Degisken tanimlari bitis


  // set ve get işlemleri baslangic

  set userListFromInit(value) {
    _userListFromInit = value;
  }

  List<Map<String, dynamic>> get userListFromInit {
    return _userListFromInit;
  }

  // set ve get islemleri bitis

  bool isVerifiedEmail() {
    return _firebaseAuthX.isVerifiedEmailX();
  }

  @override
  Future<UserCheetah?> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    _email = email;
    _password = password;
    _name = name;

    //Burada if yapısı ile null kontrolü yapılacakk. Çünkü girilen değer
    // hatalı olursa herhangi bir user döndürülmez!
    _user =
        await _firebaseAuthX.createUserWithEmailAndPassword(_email, _password, _name);
    UserCheetah userCheetah =
        ChangeUserModel.fromFirebaseUserToUserCheetah(_user);
   /* if (_user != null) {
      await createUserOnDatabaseDuringSignUp(userCheetah, _name);
    }*/
    return userCheetah;
  }

 /* Future<void> createUserOnDatabaseDuringSignUp(
      UserCheetah userCheetah, String name) async {
    Map<String, dynamic> data = userCheetah.toMap();
    data.addAll({'userName': name});
   // await _fireStoreDB.createUser(data);
  }*/


  @override
  Future<UserCheetah?> signInWithEmailAndPassword(
      String email, String password) async {
    _user = (await _firebaseAuthX.signInWithEmailAndPassword(email, password));
    UserCheetah userCheetah =
        ChangeUserModel.fromFirebaseUserToUserCheetah(_user);
    return userCheetah;
  }

  @override
  Future<UserCheetah?> currentUser() async {
    User? user = await _firebaseAuthX.currentUser();
    _currentUser = user;
    if (user != null) {
      UserCheetah? userCheetah =
          ChangeUserModel.fromFirebaseUserToUserCheetah(user);
      return userCheetah;
    } else {
      return null;
    }
  }

  @override
  Future<void> signOut(BuildContext? context) async {
    // UserCheetah? userCheetah = await currentUser();
    // await _fireStoreDB.updateUserData(userCheetah!.toMap(), "Name");
    await _firebaseAuthX.signOut();
  }

  
  Future<void> updateUserData(
      UserCheetah? userCheetah, String updateID, dynamic data) async {
    await _fireStoreDB.updateUserData(userCheetah, updateID, data);
  }

  Stream? userChangeX() {
    return _firebaseAuthX.userChangeX();
  }

  Future<QuerySnapshot<Object?>> getAllUserList() async {
    QuerySnapshot<Object?> _snapFromFirebase =
        await _fireStoreDB.getAllUserList();
    List<QueryDocumentSnapshot<Object?>> users = _snapFromFirebase.docs;
    users.forEach((element) {
      print("serap fistik " + element.data().toString());
      usersMap?.add(element.data() as Map<String, dynamic>);
    });
    usersMap?.forEach((element) {
      print("offfff " + element.toString());
    });
    return _snapFromFirebase;
  }
}

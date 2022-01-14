import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/core/services/firebase_auth_service.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/change_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Repository implements AuthBase{

  late String _email, _password;
  late User _user;
  final FirebaseAuthX _firebaseAuthX = locator<FirebaseAuthX>();

  @override
  Future<UserCheetah> createUserWithEmailAndPassword(String email, String password) async {
    _email = email;
    _password = password;

    //Burada if yapısı ile null kontrolü yapılacakk. Çünkü girilen değer
    // hatalı olursa herhangi bir user döndürülmez!
    _user = (await  _firebaseAuthX.createUserWithEmailAndPassword(_email, _password))!;
    UserCheetah userCheetah = ChangeUserModel.fromFirebaseUserToUserCheetah(_user);
    return userCheetah;
  }

  @override
  Future<UserCheetah> signInWithEmailAndPassword(String email, String password) async {
    _user = (await _firebaseAuthX.signInWithEmailAndPassword(email, password))!;
    UserCheetah userCheetah = ChangeUserModel.fromFirebaseUserToUserCheetah(_user);
    return userCheetah;
  }


}
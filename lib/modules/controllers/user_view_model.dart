import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:flutter/material.dart';



class UserModelView with ChangeNotifier implements AuthBase {

  String? _name, _email, _password, _confirmPassword;

  @override
  Future<UserCheetah?> createUserWithEmailAndPassword() {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<UserCheetah?> signInWithEmailAndPassword() {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

}
import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';



class UserModelView with ChangeNotifier implements AuthBase {


  late String _name, _email, _password, _confirmPassword;

  Repository _repository = locator<Repository>();

  @override
  Future<UserCheetah> createUserWithEmailAndPassword(String email, String password) async {
    _email = email;
    _password = password;
    UserCheetah userCheetah = await _repository.createUserWithEmailAndPassword(_email, _password);
    return userCheetah;
  }

  @override
  Future<UserCheetah> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

}
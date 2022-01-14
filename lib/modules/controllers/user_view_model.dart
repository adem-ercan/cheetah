import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';



class UserModelView with ChangeNotifier implements AuthBase {



  final Repository _repository = locator<Repository>();

  @override
  Future<UserCheetah> createUserWithEmailAndPassword(String email, String password) async{

    UserCheetah userCheetah = await _repository.createUserWithEmailAndPassword(email, password);
    return userCheetah;
  }

  @override
  Future<UserCheetah> signInWithEmailAndPassword(String email, String password) async{

    UserCheetah userCheetah = await _repository.signInWithEmailAndPassword(email, password);
    return userCheetah;
  }

}
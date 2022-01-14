import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';



class UserModelView with ChangeNotifier implements AuthBase {
  
   UserCheetah? currentUserX;

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


  @override
  Future<UserCheetah> currentUser() async{
    UserCheetah? userCheetah = await _repository.currentUser();
    currentUserX = userCheetah;
    return currentUserX!;
  }

  @override
  Future<void> signOut() async{
    await _repository.signOut();
    currentUserX = null;
  }

  @override
  Stream<UserCheetah> userChange(UserCheetah user) {
    // TODO: implement userChange
    throw UnimplementedError();
  }

}
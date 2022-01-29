import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';



class UserModelView with ChangeNotifier implements AuthBase {
  
   UserCheetah? _currentUserX;
   BuildContext? _currentContext;

  final Repository _repository = locator<Repository>();
  final RouteModel _route = locator<RouteModel>();

   UserCheetah? get currentUserX => _currentUserX;



   @override
  Future<UserCheetah> createUserWithEmailAndPassword(String email, String password, String name) async{

    UserCheetah userCheetah = await _repository.createUserWithEmailAndPassword(email, password, name);
    _currentUserX = userCheetah;
    return userCheetah;
  }

  @override
  Future<UserCheetah> signInWithEmailAndPassword(String email, String password) async{
    UserCheetah userCheetah = await _repository.signInWithEmailAndPassword(email, password);
    _currentUserX = userCheetah;
    if(userCheetah.email==email){
      _route.goToMainScreen(_currentContext!);
    }
    notifyListeners();
    return userCheetah;
  }


  @override
  Future<UserCheetah> currentUser() async{
    UserCheetah? userCheetah = await _repository.currentUser();
    _currentUserX = userCheetah;
    return _currentUserX!;
  }

  @override
  Future<void> signOut(BuildContext? context) async{
     try{
       await _repository.signOut(context);
       //_currentUserX = null;
      // _route.goToLoginScreen(context!);
     }catch(e){
       debugPrint(e.toString());
     }

  }

  BuildContext getCurrentContext(BuildContext context){
     _currentContext = context;
     return context;
  }




}
import 'package:cheetah/core/bases/firebase_authentication_base.dart';
import 'package:cheetah/core/services/error_catch_service.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthX implements FirebaseAuthBase {
  late String _email, _password;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? _currentUser;
  final CatchErrorService _catchErrorService = locator<CatchErrorService>();

  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    _email = email;
    _password = password;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint("servisten gelen: " + e.toString());
    }
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("servisten gelen: " + e.toString());
      getErrorData(e.code, e.toString()+"boookkk deliiii");

      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      debugPrint("servisten gelen2: " + e.toString());
    }
  }

  @override
  Stream<User?> userChange() async* {
    Stream<User?> _userChange = auth.userChanges();
    yield* _userChange;
  }

  @override
  Future<User?> currentUser() async {
    User? user = auth.currentUser;
    _currentUser = user;
    return user;
  }

  @override
  Future<void> signOut() async {
    return await auth.signOut();
  }

  Stream<User?> userChangeX() {
    return auth.userChanges();
  }

  CatchErrorService getErrorData(String errorCodeData, String errorTextData) {
    _catchErrorService.errorCode = errorCodeData;
    _catchErrorService.errorText = errorTextData;
    return _catchErrorService;
  }
}

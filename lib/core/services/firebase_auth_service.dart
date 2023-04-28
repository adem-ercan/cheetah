import 'package:cheetah/core/bases/firebase_authentication_base.dart';
import 'package:cheetah/core/services/firestore_service.dart';
import 'package:cheetah/modules/models/error_catch_model.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthX implements FirebaseAuthBase {
  late String _email, _password, _name;
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? _currentUser;
  final CatchErrorService _catchErrorService = locator<CatchErrorService>();
  final FireStoreDB _fireStoreDB = locator<FireStoreDB>();

  bool isVerifiedEmailX() {
    if (auth.currentUser != null && auth.currentUser!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    _email = email;
    _password = password;
    _name = name;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      await userCredential.user?.sendEmailVerification().then((value) => print("bitti lan"));

      //Auth işlemi ile beraber Cloud FireStore DB'ye kullanıcı kaydı
      //bu fonksiyon ile yapılıyor.
      await _fireStoreDB.createUser(userToMap(userCredential.user!));

      return userCredential.user;


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint("servisten gelen: $e");
    }
    return null;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      /* if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        debugPrint("verify yapıldı");
      } else if(userCredential.user!.emailVerified) {
        return userCredential.user;
      }*/

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("servisten gelen: $e");
      getErrorData(e.code, "${e} boookkk deliiii");

      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      debugPrint("servisten gelen2: $e");
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

  Future<void> deleteAccount() async {
    auth.currentUser!.delete();
  }

  Map<String, dynamic> userToMap(User user) {
    Map<String, dynamic> userMap = {
      'email': user.email,
      'userName': _name,
      'userID': user.uid,
      'profilePhotoURL':
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      'isEmailVerify': user.emailVerified,
      'friends': []
    };
    return userMap;
  }
}

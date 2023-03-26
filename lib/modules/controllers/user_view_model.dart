import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/modules/models/error_catch_model.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum WaitingState { busy, notBusy }

enum ResponseAuthentication {
  idle,
  userFound,
  userNotFound,
  error,
  emailFormatNotSuitable
}

class UserModelView with ChangeNotifier implements AuthBase {
  UserCheetah? _currentUserX;
  WaitingState _waitingState = WaitingState.notBusy;
  ResponseAuthentication _responseAuthentication = ResponseAuthentication.idle;
  final Repository _repository = locator<Repository>();
  final CatchErrorService _catchErrorService = locator<CatchErrorService>();

  UserCheetah? get currentUserX => _currentUserX;

  set responseAuthentication(ResponseAuthentication value) {
    _responseAuthentication = value;
    notifyListeners();
  }

  ResponseAuthentication get responseAuthentication => _responseAuthentication;

  set waitingState(WaitingState value) {
    _waitingState = value;
    notifyListeners();
  }

  WaitingState get waitingState => _waitingState;

  bool isVerifiedEmail() {
    return _repository.isVerifiedEmail();
  }

  @override
  Future<UserCheetah?> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    waitingState = WaitingState.busy;

    UserCheetah? userCheetah =
        await _repository.createUserWithEmailAndPassword(email, password, name);
    _currentUserX = userCheetah;
    return userCheetah;
  }

  @override
  Future<UserCheetah?> signInWithEmailAndPassword(
      String email, String password) async {
    //Buradaki  button state işlemi component state'e taşınacak
    waitingState = WaitingState.busy;
    UserCheetah? userCheetah =
        await _repository.signInWithEmailAndPassword(email, password);
    _currentUserX = userCheetah;

    if (userCheetah != null) {
      Future.delayed(const Duration(seconds: 2), () {
        waitingState = WaitingState.notBusy;
        if (!isVerifiedEmail())
          responseAuthentication = ResponseAuthentication.userNotFound;
        debugPrint(_catchErrorService.errorText);
        debugPrint(_catchErrorService.errorCode);
      });
    } else {
      // responseAuthentication = ResponseAuthentication.userNotFound;
      waitingState = WaitingState.busy;
    }

    return userCheetah;
  }

  @override
  Future<UserCheetah?> currentUser() async {
    UserCheetah? userCheetah = await _repository.currentUser();
    _currentUserX = userCheetah;
    return _currentUserX;
  }

  @override
  Future<void> signOut(BuildContext? context) async {
    try {
      await _repository.signOut(context);
      _currentUserX = null;
      // _route.goToLoginScreen(context!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateUserData(String updateId, data) async {
    //Kullancı profil bilgilerini güncelleme fonksiyonu
    UserCheetah? currentCheetahUser = await _repository.currentUser();
    try {
      await _repository.updateUserData(currentCheetahUser, updateId, data);
    } catch (e) {}
  }

  BuildContext getCurrentContext(BuildContext context) {
    return context;
  }

  Stream? userChangeX() {
    return _repository.userChangeX();
  }

  Future<QuerySnapshot<Object?>> getAllUserList() async {
    QuerySnapshot<Object?> snapshot = await _repository.getAllUserList();
    return snapshot;
  }
}

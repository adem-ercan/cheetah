import 'package:cheetah/modules/models/user_model.dart';
import 'package:flutter/material.dart';


abstract class AuthBase {
  Future<UserCheetah?> createUserWithEmailAndPassword(String email, String password, String name);
  Future<UserCheetah?> signInWithEmailAndPassword(String email, String password);
  Future<UserCheetah?> currentUser();
  Future<void> signOut(BuildContext? context);
}
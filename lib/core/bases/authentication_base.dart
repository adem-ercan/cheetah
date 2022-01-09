
import 'package:cheetah/modules/models/user_model.dart';
import 'package:flutter/material.dart';

abstract class AuthBase {
  Future<UserCheetah> createUserWithEmailAndPassword();
  Future<UserCheetah> signInWithEmailAndPassword();
}
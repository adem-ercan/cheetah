import 'package:cheetah/modules/models/user_model.dart';

abstract class AuthBase {
  Future<UserCheetah?> createUserWithEmailAndPassword();
  Future<UserCheetah?> signInWithEmailAndPassword();
}
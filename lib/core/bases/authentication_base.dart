import 'package:cheetah/modules/models/user_model.dart';

abstract class AuthBase {
  Future<UserCheetah> createUserWithEmailAndPassword(String email, String password);
  Future<UserCheetah> signInWithEmailAndPassword(String email, String password);
  Future<UserCheetah> currentUser();
  Future<void> signOut();
  Stream<UserCheetah> userChange(UserCheetah user);
}
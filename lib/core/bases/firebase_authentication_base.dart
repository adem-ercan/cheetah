import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthBase {
  Future<User?> createUserWithEmailAndPassword(String email, String password);
  Future<User?> signInWithEmailAndPassword(String email, String password);
}
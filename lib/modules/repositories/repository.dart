import 'package:cheetah/core/bases/authentication_base.dart';
import 'package:cheetah/core/services/firebase_auth_service.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Repository implements AuthBase{

  late String _email, _password;
  late User _user;
  final FirebaseAuthX _firebaseAuthX = locator<FirebaseAuthX>();

  @override
  Future<UserCheetah> createUserWithEmailAndPassword(String email, String password) async {
    _email = email;
    _password = password;
    _user = (await  _firebaseAuthX.createUserWithEmailAndPassword(_email, _password))!;
    UserCheetah userCheetah = fromUsertoUserCheetah(_user);
    return userCheetah;
  }

  @override
  Future<UserCheetah> signInWithEmailAndPassword() {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }


  UserCheetah fromUsertoUserCheetah(User user){
    Map<String, dynamic> userMap ={
      'userID' : user.uid,
      'email' : user.email
    };
    return UserCheetah.fromMap(userMap);
  }

}
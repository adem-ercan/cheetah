
import 'package:cheetah/modules/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class  ChangeUserModel {

  static UserCheetah fromFirebaseUserToUserCheetah(User user){
    Map<String, dynamic> userMap ={
      'userID' : user.uid,
      'email' : user.email
    };
    return UserCheetah.fromMap(userMap);
  }

  static Map<String, dynamic> fromUserCheetahToFirebaseUser(UserCheetah user){
    return user.toMap();
  }
}
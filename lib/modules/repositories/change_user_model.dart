import 'package:cheetah/modules/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangeUserModel {
  static UserCheetah fromFirebaseUserToUserCheetah(User? user) {
    if (user != null) {
      Map<String, dynamic> userMap = {'userID': user.uid, 'email': user.email};
      return UserCheetah.fromMap(userMap);
    } else {
      //Burası derlenip toparlanıp düzgün bir kod yazılacak
      return UserCheetah.fromMap({"Deneme": "deneme"});
    }
  }

  static Map<String, dynamic> fromUserCheetahToFirebaseUser(
      UserCheetah userCheetah) {
    return userCheetah.toMap();
  }
  
}

import 'package:cheetah/core/bases/firestore_cloud_base.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreDB implements FireStoreBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /* Future<void> createUser(Map<String, dynamic> data){
    CollectionReference users = _firestore.collection('users');
    return users.add({
      'email': data['email'],
      'userName' : data['userName'],
      'userID' : data['userID'],
    }).then((value) => print("Kayıt Yapıldı")).catchError((onError)=>print("hata var DB'de: $onError"));
  }*/
  Future<void> createUser(Map<String, dynamic> data) {
    CollectionReference users = _firestore.collection('users');
    return users
        .doc(data['userID'])
        .set({
          'email': data['email'],
          'userName': data['userName'],
          'userID': data['userID'],
            
        })
        .then((value) => debugPrint("Kayıt Yapıldı"))
        .catchError((onError) => debugPrint("hata var DB'de: $onError"));
  }

  @override
  Future<void> updateUserData(
      UserCheetah? userCheetah, String updateID, dynamic data) async {
    CollectionReference users = _firestore.collection('users');
    Map<String, dynamic> userData = userCheetah!.toMap();
    try {
      switch (updateID) {
        case "USER_NAME":
          await users.doc(userData['userID']).update({'userName': data});
          debugPrint("User Name Update işlemi başarılı bir şekilde yapıldı");
          break;
        case "EMAİL":
          await users.doc(userData['userID']).update({'email': data});
          break;
        }
    } catch (e) {
      debugPrint("Update işleminde hata çıktı. Çıkan hata şu: " + e.toString());
    }
  }
}

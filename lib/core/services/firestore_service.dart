import 'package:cheetah/core/bases/firestore_cloud_base.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreDB implements FireStoreBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*Future<void> createUser(Map<String, dynamic> data){
    CollectionReference users = _firestore.collection('users');
    return users.add({
      'email': data['email'],
      'userName' : data['userName'],
      'userID' : data['userID'],
    }).then((value) => print("Kayıt Yapıldı"))
    .catchError((onError)=>print("hata var DB'de: $onError"));
  }*/

  Future<void> createUser(Map<String, dynamic> data) {
    CollectionReference users = _firestore.collection('users');

    return users
        .doc(data['userID'])
        .set({
          'email': data['email'],
          'userName': data['userName'],
          'userID': data['userID'],
          'profilePhotoURL': data['profilePhotoURL'],
          'isEmailVerify': data['isEmailVerify'],
          'friends': [],
          'chatContent': data['chatContent'] ?? {"Henuz sohbet yok": 0}
        })
        .then((value) => debugPrint("Kayit yapildi"))
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
        case "EMAIL_VERIFY":
          await users.doc(userData['userID']).update({'isEmailVerify': data});
          break;
      }
    } catch (e) {
      debugPrint("Update işleminde hata çıktı. Çıkan hata şu: " + e.toString());
    }
  }

  Future<QuerySnapshot> getAllUserList() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    QuerySnapshot documentSnapshot = await users.get();
    return documentSnapshot;
  }

  Future<void> createChatDialog(Map<String, dynamic> data) {
    CollectionReference messages = _firestore.collection('messages');
    //İlk kullanıcı oluşturulurken veritabanında
    return messages
        .doc()
        .set({
          'userIDs': [],
          'content': data['content'],
          'timeInfo': data['timeInfo'],
        })
        .then((value) => debugPrint("Message Kayit Yapildi"))
        .catchError(
            (onError) => debugPrint("Message hata var DB'de: $onError"));
  }

  Future<List?> getFriendsList(String? userID) async {
  
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("users").doc(userID).get();
    List friends = await snapshot.data()!["friends"];
    //getFriendData(friends[0]);
    //List<Map<String, dynamic>> friendDataList = [];

    for (var friend in friends) {
      DocumentSnapshot<Map<String, dynamic>> snap =
        await _firestore.collection("users").doc(friend).get();
        Map<String, dynamic>? data = snap.data();
        print("aaaa " + data.toString());
    }
      
    return friends;
  }
}

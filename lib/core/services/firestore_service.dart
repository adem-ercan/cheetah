import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class FireStoreDB  {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 /* Future<void> createUser(Map<String, dynamic> data){
    CollectionReference users = _firestore.collection('users');
    return users.add({
      'email': data['email'],
      'userName' : data['userName'],
      'userID' : data['userID'],
    }).then((value) => print("Kayıt Yapıldı")).catchError((onError)=>print("hata var DB'de: $onError"));
  }*/

   Future<void> createUser(Map<String, dynamic> data){
    CollectionReference users = _firestore.collection('users');
    return users.doc(data['userID']).set({
      'email': data['email'],
      'userName' : data['userName'],
      'userID' : data['userID'],

    })
    .then((value) => debugPrint("Kayıt Yapıldı"))
    .catchError((onError)=>debugPrint("hata var DB'de: $onError"));


  }
}
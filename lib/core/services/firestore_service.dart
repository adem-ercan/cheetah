import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class FireStoreDB  {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(Map<String, dynamic> data){
    CollectionReference users = _firestore.collection('users');
    return users.add({
      'email': data['email'],
      'userName' : data['userName'],
      'userID' : data['userID'],

    }).then((value) => print("Kayıt Yapıldı")).catchError((onError)=>print("hata var DB'de: $onError"));


  }
}
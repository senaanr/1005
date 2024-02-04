import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class MyUser {
  String? id;
  String? name;
  String? email;
  String? profileImg="";
  String? userName;

  MyUser({this.name, this.userName, this.email, this.id,this.profileImg});

  MyUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    profileImg = json['profileImg'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['profileImg'] = profileImg;
    data['userName'] = userName;
    return data;
  }

  factory MyUser.firebasedenuret(User kullanici) {
    return MyUser(
      id: kullanici.uid,
      userName: kullanici.displayName,
      email: kullanici.email,
    );
  }

  factory MyUser.dokumandanuret(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    return MyUser(
      id: doc.id,
      name: data?['name'],
      email: data?['email'],
      profileImg: data?['profileImg'],
      userName: data?['userName'],
    );
  }
}
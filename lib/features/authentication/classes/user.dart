import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class MyUser {
  String? id;
  String? name;
  String? profileImg="";
  String? userName;
  String? userNameColor="0${Colors.black.toString().split('Color(0')[1].toString().split(')')[0].toString()}";
  String? backgroundColor="0${TColors().backgroundColor.toString().split('Color(0')[1].toString().split(')')[0].toString()}";
  double? borderRadius=6;
  String? buttonStyle="SoftShadow";

  MyUser({this.name, this.userName});

  MyUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImg = json['profileImg'];
    userName = json['userName'];
    borderRadius = json['borderRadius'];
    userNameColor = json['userNameColor'];
    backgroundColor = json['backgroundColor'];
    buttonStyle = json['buttonStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profileImg'] = profileImg;
    data['userName'] = userName;
    data['borderRadius'] = borderRadius;
    data['userNameColor'] = userNameColor;
    data['backgroundColor'] = backgroundColor;
    data['buttonStyle'] = buttonStyle;
    return data;
  }
}
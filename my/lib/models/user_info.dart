

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String address;
  String avator_address;
  String? ban_time;
  String email;
  //String fans;
  //String? follows;
  bool? isBan;
  String? sex;
  String? signature;
  String? tel;
  int? uid;
  String? username;

  UserInfo(
      this.address,
      this.avator_address,
      this.ban_time,
      this.email,
      //this.fans,
      //this.follows,
      this.isBan,
      this.sex,
      this.signature,
      this.tel,
      this.uid,
      this.username);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

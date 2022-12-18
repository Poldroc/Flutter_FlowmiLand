// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['address'] as String,
      json['avator_address'] as String,
      json['ban_time'] as String?,
      json['email'] as String,
      json['isBan'] as bool?,
      json['sex'] as String?,
      json['signature'] as String?,
      json['tel'] as String?,
      json['uid'] as int?,
      json['username'] as String?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'address': instance.address,
      'avator_address': instance.avator_address,
      'ban_time': instance.ban_time,
      'email': instance.email,
      'isBan': instance.isBan,
      'sex': instance.sex,
      'signature': instance.signature,
      'tel': instance.tel,
      'uid': instance.uid,
      'username': instance.username,
    };

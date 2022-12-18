// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Land_Detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandDetailData _$LandDetailDataFromJson(Map<String, dynamic> json) =>
    LandDetailData(
      json['buy_id'] as String?,
      json['comment_num'] as int?,
      json['detail_position'] as String?,
      json['isOn'] as bool?,
      json['isRent'] as bool?,
      json['publish_time'] as String?,
      json['update_time'] as String?,
      json['view'] as int?,
      json['sell_user'] as Map<String, dynamic>?,
      json['pic_nums'] as int?,
      json['state'] as String?,
      json['sell_id'] as int?,
      json['uid'] as String?,
      json['collections'] as int?,
      json['ageLimit'] as String?,
      json['avator_address'] as String?,
      json['address'] as String?,
      (json['pic_address'] as List<dynamic>).map((e) => e as String?).toList(),
      json['area'] as String?,
      json['land_id'] as int?,
      json['describe'] as String?,
      json['price'] as String?,
      (json['tags'] as List<dynamic>).map((e) => e as String?).toList(),
      json['land_type'] as String?,
      json['username'] as String?,
    );

Map<String, dynamic> _$LandDetailDataToJson(LandDetailData instance) =>
    <String, dynamic>{
      'sell_user': instance.sell_user,
      'username': instance.username,
      'avator_address': instance.avator_address,
      'land_id': instance.land_id,
      'sell_id': instance.sell_id,
      'buy_id': instance.buy_id,
      'comment_num': instance.comment_num,
      'detail_position': instance.detail_position,
      'isOn': instance.isOn,
      'isRent': instance.isRent,
      'publish_time': instance.publish_time,
      'update_time': instance.update_time,
      'view': instance.view,
      'uid': instance.uid,
      'address': instance.address,
      'price': instance.price,
      'land_type': instance.land_type,
      'area': instance.area,
      'ageLimit': instance.ageLimit,
      'describe': instance.describe,
      'collections': instance.collections,
      'pic_nums': instance.pic_nums,
      'state': instance.state,
      'tags': instance.tags,
      'pic_address': instance.pic_address,
    };

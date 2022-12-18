// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Collect_Land_Detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectLandDetailData _$CollectLandDetailDataFromJson(
        Map<String, dynamic> json) =>
    CollectLandDetailData(
      json['collect_time'] as String?,
      json['id'] as int?,
      json['land'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CollectLandDetailDataToJson(
        CollectLandDetailData instance) =>
    <String, dynamic>{
      'collect_time': instance.collect_time,
      'id': instance.id,
      'land': instance.land,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Land_Comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandComment _$LandCommentFromJson(Map<String, dynamic> json) => LandComment(
      json['commentUser'] as Map<String, dynamic>?,
      json['comment_time'] as String?,
      json['content'] as String?,
      json['id'] as int?,
      json['land_id'] as int?,
    );

Map<String, dynamic> _$LandCommentToJson(LandComment instance) =>
    <String, dynamic>{
      'commentUser': instance.commentUser,
      'comment_time': instance.comment_time,
      'content': instance.content,
      'id': instance.id,
      'land_id': instance.land_id,
    };

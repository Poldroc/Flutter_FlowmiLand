

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Land_Comment.g.dart';

@JsonSerializable()
class LandComment {
  Map? commentUser;
  String? comment_time;
  String? content;
  int? id;
  int? land_id;

  LandComment(
      this.commentUser, this.comment_time, this.content, this.id, this.land_id);
 
 
 
 
 factory LandComment.fromJson(Map<String, dynamic> json) =>
      _$LandCommentFromJson(json);

  Map<String, dynamic> toJson() => _$LandCommentToJson(this);
}
//flutter packages pub run build_runner build
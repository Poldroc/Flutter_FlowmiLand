
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Collect_Land_Detail.g.dart';

@JsonSerializable()
class CollectLandDetailData {
  String? collect_time;
  int? id;
  Map? land;

  CollectLandDetailData(this.collect_time, this.id, this.land);

factory CollectLandDetailData.fromJson(Map<String, dynamic> json) =>
      _$CollectLandDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$CollectLandDetailDataToJson(this);

}
//flutter packages pub run build_runner clean
//flutter packages pub run build_runner build --delete-conflicting-outputs
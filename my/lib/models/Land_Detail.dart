//土地数据
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Land_Detail.g.dart';

@JsonSerializable()
class LandDetailData {
   Map? sell_user;
   String? username;
   String? avator_address=null;
   int? land_id;
   int? sell_id;
   String? buy_id;
   int? comment_num;
   String? detail_position;
   bool? isOn;
   bool? isRent;
   String? publish_time;
   String? update_time;
   int? view;
   String? uid;
   String? address;
   String? price;
   String? land_type;
   String? area;
   String? ageLimit;
   String? describe;
   int? collections;
   int? pic_nums;
   String? state;
   List<String?> tags;
   List<String?> pic_address;

  LandDetailData(
      this.buy_id, this.comment_num, this.detail_position, this.isOn, this.isRent, this.publish_time, this.update_time, this.view, this.sell_user,
       this.pic_nums,
       this.state,
       this.sell_id,
       this.uid,
       this.collections,
       this.ageLimit,
       this.avator_address,
       this.address,
       this.pic_address,
       this.area,
       this.land_id,
       this.describe,
       this.price,
       this.tags,
       this.land_type,
       this.username);

  factory LandDetailData.fromJson(Map<String, dynamic> json) =>
      _$LandDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$LandDetailDataToJson(this);
}
//flutter packages pub run build_runner build
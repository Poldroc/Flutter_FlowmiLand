import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/data/recommendList.dart';
import 'package:my/app/data/LandDetailDefaultdata.dart';
import 'package:my/app/widget/common_landDetail.dart.dart';

import 'package:my/app/widget/common_image.dart';
import 'package:my/app/widget/common_tag.dart';
import 'package:my/app/widget/user_row.dart';

import '../../utils/config.dart';

class LandListItemWidget extends StatelessWidget {
  
  final item;
  const LandListItemWidget(
     this.item, {
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String avatorAddress = Config.BaseUrl + item.sell_user["avator_address"];
    String picture =
        Config.BaseUrl + item.pic_address[0];
        //"https://img9.vilipix.com/picture/pages/regular/2021/05/09/17/15/50140585_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000";
    print(avatorAddress);
    print(item.land_id.toString() + "   " + picture);

    return GestureDetector(
      onTap: () {
        Get.to(LandDetailPage(), arguments: item);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: GlobalColors.kContainerColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Row(
            children: [
              UserRow(
                  userImage: avatorAddress,
                  userName: item.sell_user["username"]),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              item.address,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: //Image.network(picture)
                      CommonImage(
                    width: 160,
                    height: 110,
                    src: picture,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 5,
                      children: item.tags
                          .map<Widget>((item) => CommonTag(
                                title: item,
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * 0.36,
                      child: Text(
                        item.describe,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "预期价格: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                item.price.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.green),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

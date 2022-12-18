import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my/app/widget/common_image.dart';
import 'package:my/app/widget/user_row.dart';

import '../../../../../utils/config.dart';
import '../../../../widget/common_landDetail.dart.dart';

List defaultPicture = [
  "https://img9.vilipix.com/picture/pages/regular/2022/08/31/12/101733334_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000",
  "https://img9.vilipix.com/picture/pages/regular/2022/08/31/12/101091270_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000",
  "https://img9.vilipix.com/picture/pages/regular/2022/08/31/12/101137838_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000",
  "https://img9.vilipix.com/picture/pages/regular/2022/08/31/12/101048953_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000",
  "https://img9.vilipix.com/picture/pages/regular/2021/05/09/17/15/50140585_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000",
];

class ItemWidget extends StatelessWidget {
  final infoData;
  const ItemWidget({super.key, required this.infoData});

  @override
  Widget build(BuildContext context) {
    String avatorAddress =
        Config.BaseUrl + infoData.sell_user["avator_address"];
    String picture = //"https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg";
    Config.BaseUrl + infoData.pic_address[0];
    Size size = MediaQuery.of(context).size;
    return 
       Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
              
        Get.to(LandDetailPage(), arguments: infoData);
        
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // 图片
              ClipRRect(
                borderRadius:BorderRadius.circular(15),
                child: Container(
                  
                  //width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: picture, //这里是网络图片
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              /* ExtendedImage.network(
                picture,
                enableLoadState:true,

                fit: BoxFit.fill,
                cache: true,
                shape: BoxShape.rectangle,

                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //cancelToken: cancellationToken,
              ), */
              // 地址
              Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Text(
                    infoData.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 5,
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: UserRow(
                  userImage: avatorAddress,
                  userName: infoData.sell_user["username"],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}

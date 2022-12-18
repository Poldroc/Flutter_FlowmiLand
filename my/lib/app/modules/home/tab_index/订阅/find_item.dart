import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/widget/common_image.dart';
import 'package:my/app/widget/user_row.dart';

import '../../../../data/LandDetailDefaultdata.dart';
import 'view/heroImagePage.dart';

List<LandDetailData> data = defaultList;
Widget buildFocusListView() {
  return ListView.builder(
    itemCount: defaultList.length,
    itemBuilder: ((context, index) {
      if (defaultList[index] == null) {
        //显示加载更多
        return Container(
            alignment: Alignment.center,
            height: 40,
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ));
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getItemList(index)),
        );
      }
    }),
    //controller: _scrollController,
  );
}

List<Widget> getItemList(int index) {
  List<Widget> itemList = [];

  itemList.add(FocusUserRow(
      userImage: defaultList[index].avator_address,
      userName: defaultList[index].username));
  itemList.add(Padding(
    padding: EdgeInsets.only(right: 10, left: 40),
    child: Text(
      defaultList[index].address,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  ));
  itemList.add(FocusUserLandImage(
    LandImage: defaultList[index].pic_address,index: index
  ));
  itemList.add(Divider(
    color: Colors.grey,
  ));

  return itemList;
}

Widget FocusUserRow({required String userImage, required String userName}) {
  return Row(
    children: [
      SizedBox(
        width: 32,
        height: 32,
        child: ClipOval(
            child: CommonImage(
          src: userImage,
          fit: BoxFit.cover,
          height: 32,
          width: 32,
        )),
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        userName,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      )
    ],
  );
}

Widget FocusUserLandImage({required List<String> LandImage,required int index}) {
  return Container(
      padding: EdgeInsets.only(top: 8, left: 40, right: 20, bottom: 12),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: LandImage.map((item) {
          return GestureDetector(
            onTap: () {
              print(item);
              Get.to(HeroPage(arguments: {
                "initialPage": LandImage.indexOf(item),
                "listData": LandImage
              }));
            },
            child: CommonImage(
                src: item, fit: BoxFit.cover, height: 150, width: 100),
          );
        }).toList(),
      ));
}

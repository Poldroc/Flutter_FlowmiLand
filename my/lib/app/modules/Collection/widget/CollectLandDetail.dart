import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../models/Collect_Land_Detail.dart';
import '../../../../scoped_model/auth.dart';
import '../../../../utils/dio_http.dart';
import '../../../../utils/http_helper.dart';
import '../../../../utils/scopoed_model_helper.dart';
import '../../../colors/global.colors.dart';
import '../../../widget/common_swiper.dart';
import '../../../widget/common_tag.dart';
import '../../../widget/common_title.dart';

BuildContext context = navigatorKey.currentState!.overlay!.context;

class CollectLandDetail extends StatefulWidget {
  CollectLandDetail({super.key});

  @override
  State<CollectLandDetail> createState() => _CollectLandDetailState();
}

class _CollectLandDetailState extends State<CollectLandDetail> {
  late CollectLandDetailData data;

  @override
  void initState() {
    setState(() {
      data = Get.arguments;
    });
    super.initState();
  }

  var uid = ScopedModelHelper.getModel<AuthModel>(context).userInfo!.uid;
  var token = ScopedModelHelper.getModel<AuthModel>(context).token;
  
  bool isLike = true;
  bool showAllText = false;
  _UncollectLand() async {
    var url = HttpHelper.UnCollect_Land;

    var res = await DioHttp.of(context)
        .post(url, {"collect_id": data.id, "uid": uid, "token": token});

    var resMap = json.decode(res.toString());
    int status = resMap['code'];

    if (status == 1) {
      isLike = false;
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: "已取消收藏");
      setState(() {});
    } else {
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: "未收藏");
    }
  }

  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    //if (null == data) return Container();
    bool showTextTool = data.land!["describe"].length > 100;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: GlobalColors.kPrimaryLightColor,
        title: Text(
          '土地详情',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              GestureDetector(
                  onTap: (() {
                    /* Get.to(HeroPage(arguments: {
                      "initialPage": 0,
                      "listData": data.pic_address
                    })); */
                  }),
                  child: CommonSwiper(images: data.land!["pic_address"])),

              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "预期价格: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          data.land!["price"],
                          style: TextStyle(color: Colors.green, fontSize: 25),
                        ),
                        Text(
                          " 元",
                          style: TextStyle(
                            fontSize: 20, /* color: GlobalColors.kPinkColor */
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                child: Wrap(
                    spacing: 12,
                    children: data.land!["tags"]
                        .map<Widget>(((item) => CommonTag(title: item)))
                        .toList()),
              ),
              Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
              ),
              //CommonTitle(title: '土地信息'),
              Container(
                padding: EdgeInsets.only(left: 10, top: 6, bottom: 6),
                child: Wrap(children: [
                  BaseInfoItem(
                    content: '地点 : ${data.land!["address"]} ',
                  ),
                  BaseInfoItem(
                    content: '年限 : 10年 ',
                  ),
                  BaseInfoItem(
                    content: '面积 : ${data.land!["area"]}平米 ',
                  ),
                  BaseInfoItem(
                    content: '类型 : ${data.land!["land_type"]} ',
                  ),
                ]),
              ),

              CommonTitle(title: "基本描述"),

              Container(
                //height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: GlobalColors.kContainerColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //maxLines:  5,
                          data.land!["describe"]!,
                          style: TextStyle(fontSize: 15),
                        ),
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      showAllText ? '收起' : '展开',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ))
                            : Container(),
                      ]),
                ),
              ),
              Container(
                height: 100,
              )
            ],
          ),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width,
            height: 80,
            bottom: 0,
            child: Container(
              color: Colors.grey[200],
              padding:
                  EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        _UncollectLand();
                      });
                    }),
                    child: Container(
                      height: 55,
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                                isLike
                                    ? Icons.star_rate_rounded
                                    : Icons.star_border_rounded,
                                size: 32,
                                color: isLike
                                    ? GlobalColors.kPrimaryColor
                                    : GlobalColors.kPrimaryColor),
                            Text(
                              isLike ? '已收藏' : '收藏',
                              style: TextStyle(fontSize: 10),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Container(
                            decoration: BoxDecoration(
                                color: GlobalColors.kWhiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '评论土地',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.comment)
                                ]),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Container(
                            decoration: BoxDecoration(
                                color: GlobalColors.kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '联系地主',
                                    style: TextStyle(
                                        color: GlobalColors.kWhiteColor,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.message_outlined)
                                ]),
                          ),
                        )),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;
  const BaseInfoItem({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        content,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      ),
      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
    );
  }
}

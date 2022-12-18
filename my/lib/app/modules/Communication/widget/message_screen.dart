import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/Communication/widget/body.dart';

import '../../../../models/Land_Detail.dart';
import '../../../../utils/config.dart';
import '../controllers/communication_controller.dart';
var controller = Get.put(CommunicationController());
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
 late LandDetailData data;

  @override
  void initState() {
    setState(() {
      data = Get.arguments;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: Body( data: data,),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: GlobalColors.kPrimaryLightColor,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                Config.BaseUrl + data.sell_user!["avator_address"]),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.sell_user!["username"],
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "12小时前在线",
                style: TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.local_phone)),
      IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
      SizedBox(width: 10,)],
    );
  }
}

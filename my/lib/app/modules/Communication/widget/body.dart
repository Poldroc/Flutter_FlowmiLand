import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/Communication/chatData.dart';
import 'package:my/app/modules/Communication/controllers/communication_controller.dart';
import 'package:my/app/modules/Communication/widget/chat_input_field.dart';
import 'package:my/app/modules/add/landManage/Land_manageView.dart';

import '../../../../main.dart';
import '../../../../models/Land_Detail.dart';
import '../../../../scoped_model/auth.dart';
import '../../../../utils/scopoed_model_helper.dart';

var controller = Get.put(CommunicationController());
BuildContext context = navigatorKey.currentState!.overlay!.context;

class Body extends StatefulWidget {
  final LandDetailData data;
  const Body({super.key, required this.data});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var uid = ScopedModelHelper.getModel<AuthModel>(context).userInfo!.uid;
  @override
  void initState() {
    super.initState();
    controller.connectAndListen(uid!, widget.data.sell_id!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.state.data.length,
                itemBuilder: ((context, index) {
                  return Message(
                    msg: controller.state.data[index],
                    id: uid!,
                  );
                }))),
        ChatInputField(
          hasNoText: controller.state.hasNoText,
          recipientId: widget.data.sell_id!,
        )
      ],
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
}

class Message extends StatelessWidget {
  final ChatMessageData msg;
  final int id;
  const Message({super.key, required this.msg, required this.id});

  @override
  Widget build(BuildContext context) {
    var isSender = id == msg.senderId ? true : false;

    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: isSender
                    ? GlobalColors.kPrimaryColor
                    : GlobalColors.kPolicyContainer,
                borderRadius: isSender
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))
                    : BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
            child: Text(
              msg.content!,
              style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w300),
            )),
      ],
    );
  }
}

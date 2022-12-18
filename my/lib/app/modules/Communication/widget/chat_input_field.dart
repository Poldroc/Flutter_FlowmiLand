import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../scoped_model/auth.dart';
import '../../../../utils/scopoed_model_helper.dart';
import '../../../colors/global.colors.dart';
import '../chatData.dart';
import '../controllers/communication_controller.dart';

var controller = Get.put(CommunicationController());

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    Key? key,
    required this.hasNoText,
    required this.recipientId,
  }) : super(key: key);

  final RxBool hasNoText;
  final int recipientId;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  @override
  Widget build(BuildContext context) {
    var uid = ScopedModelHelper.getModel<AuthModel>(context).userInfo!.uid;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xFF087949).withOpacity(0.08))
          ]),
      child: SafeArea(
          child: Row(
        children: [
          Icon(
            Icons.mic,
            color: GlobalColors.kPrimaryLightColor,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 40,
              child: Row(children: [
                Container(
                  width: 4,
                ),
                Expanded(
                    child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: GlobalColors.kPrimaryColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(40)),
                    child: TextField(
                      controller: controller.ChatInputController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          widget.hasNoText.value = true;
                        } else {
                          widget.hasNoText.value = false;
                        }
                      },
                    ),
                  ),
                )),
                Obx(() => Offstage(
                      offstage: !widget.hasNoText.value,
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.attach_file,
                            color: Colors.black45,
                          )),
                    )),
                SizedBox(
                  width: 4,
                ),
                Obx(() => Offstage(
                      offstage: !widget.hasNoText.value,
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black45,
                          )),
                    )),
                Obx(() => Offstage(
                      offstage: widget.hasNoText.value,
                      child: GestureDetector(
                          onTap: () {
                            var content = controller.ChatInputController.text;
                            if (content.isNotEmpty) {
                              controller.sendMsg(
                                  content, uid!, widget.recipientId);
                              controller.ChatInputController.text = '';
                              widget.hasNoText.value = true;
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          },
                          child: Container(
                              //margin:EdgeInsets.all(4) ,
                              alignment: Alignment.center,
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "发送",
                                style: TextStyle(color: Colors.white),
                              ))),
                    ))
              ]),
            ),
          )
        ],
      )),
    );
  }
}

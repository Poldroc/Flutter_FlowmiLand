import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my/app/modules/Communication/testData.dart';

import '../../../colors/global.colors.dart';
import '../controllers/communication_controller.dart';
import '../widget/chat_card.dart';
import '../widget/message_screen.dart';

class CommunicationView extends GetView<CommunicationController> {
  const CommunicationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 25.0, top: 12, bottom: 12, right: 25),
          child: Container(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: GlobalColors.kPrimaryColor)),
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/notice.png",
                width: 35,
                height: 35,
              ),
            ),
            onTap: () {},
          )
        ],
        title: const Text('消息',
            style: TextStyle(color: Color.fromARGB(255, 3, 71, 5))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    "images/love.png",
                    width: size.width * 0.2,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    "images/discuss.png",
                    width: size.width * 0.2,
                  ),
                ),
                GestureDetector(
                  child:
                      Image.asset("images/fans.png", width: size.width * 0.2),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chatUer: chatsData[index],
              press: () {
                
                Get.to(MessageScreen());
              },
            ),
          ))
        ],
      ),
    );
  }
}

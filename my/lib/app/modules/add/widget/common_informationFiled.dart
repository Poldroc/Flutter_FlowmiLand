import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/add/controllers/add_controller.dart';

class InformationFiledText extends GetView<AddController> {
  InformationFiledText({super.key});

  //var informationController=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      //margin: EdgeInsets.all(12),
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: TextField(
          controller:controller.informationController,
          style: TextStyle(fontSize: 20),
          maxLines: 6,
          maxLength: 70,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintText: '对方都关心土地可用用途,土地产权等详细描述......',
              hintStyle: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/widget/common_picker.dart';

import '../../login/roundtextfield.dart';
import '../controllers/add_controller.dart';

class AddressPriceTextFiled extends GetView<AddController> {
   AddressPriceTextFiled({super.key});

 var c =Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
         Container(
          height: 50,
          width: size.width * 0.85,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: GlobalColors.kPrimaryColor)),
          child: TextField(
            controller: c.titleController,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(7),
                //labelStyle: TextStyle(fontSize: 22,color: Colors.black),
                hintText: "标题:",
                hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: size.width * 0.85,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: GlobalColors.kPrimaryColor)),
          child: TextField(
            controller: c.addressController,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(7),
                //labelStyle: TextStyle(fontSize: 22,color: Colors.black),
                hintText: "地址:",
                hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: size.width * 0.85,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: GlobalColors.kPrimaryColor)),
          child: TextField(
            controller: c.priceController,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(7),
                //labelStyle: TextStyle(fontSize: 22,color: Colors.black),
                hintText: "预期价格:",
                hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                suffixText: "元",
                suffixStyle: TextStyle(fontSize: 10, color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: size.width * 0.85,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: GlobalColors.kPrimaryColor)),
          child: TextField(
            controller: c.ageLimitController,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(7),
                //labelStyle: TextStyle(fontSize: 22,color: Colors.black),
                hintText: "年限:",
                hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                suffixText: "年",
                suffixStyle: TextStyle(fontSize: 10, color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: size.width * 0.85,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: GlobalColors.kPrimaryColor)),
          child: TextField(
            controller: c.areaController,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(7),
                //labelStyle: TextStyle(fontSize: 22,color: Colors.black),
                hintText: "面积:",
                hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                suffixText: "平米",
                suffixStyle: TextStyle(fontSize: 10, color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: size.width * 0.85,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: GlobalColors.kPrimaryColor)),
          child: TextField(
            
            controller: c.typeController,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(7),
                //labelStyle: TextStyle(fontSize: 22,color: Colors.black),
                hintText: "土地类型:",
                hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                suffixText:"农用地/建筑用地/未利用地",
                suffixStyle: TextStyle(fontSize: 10, color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}

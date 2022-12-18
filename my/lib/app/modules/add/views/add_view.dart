import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/add/landManage/Land_manageView.dart';
import 'package:my/app/modules/add/widget/common_address_price_filedtext.dart';
import 'package:my/app/modules/add/widget/common_informationFiled.dart';
import 'package:my/app/modules/add/widget/tags.dart';
import 'package:my/app/modules/newpolicy/widget/policyListView.dart';

import '../../../../scoped_model/auth.dart';
import '../../../../utils/scopoed_model_helper.dart';
import '../controllers/add_controller.dart';
import '../widget/common_image_picker.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //var userInfo = ScopedModelHelper.getModel<AuthModel>(context).userInfo;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: GlobalColors.kPrimaryLightColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '土地信息',
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                  onPressed: (() {
                    controller.submit();
                  }),
                  icon: Icon(Icons.check)),
            ],
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // 触摸收起键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                ListView(padding: EdgeInsets.all(10), children: [
                  Column(
                    children: [
                      InformationFiledText(),
                      CommonImagePicker(onChange: (files) {}),
                      SizedBox(
                        height: 10,
                      ),
                      AddressPriceTextFiled(),
                      SizedBox(
                        height: 5,
                      ),
                      Tag(),
                      Container(
                        height: 500,
                      )
                    ],
                  ),
                ]),
                Positioned(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    bottom: 0,
                    child: Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.only(
                          top: 10, right: 20, left: 20, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(() => LandSettingTabbarView());
                                },
                                child: Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: GlobalColors.kWhiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 50,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '管理土地',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ]),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  controller.submit();
                                },
                                child: Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: GlobalColors.kPrimaryLightColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 50,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '提交土地',
                                            style: TextStyle(
                                                color: GlobalColors.kWhiteColor,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ]),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}

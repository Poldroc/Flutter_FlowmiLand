import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/User/views/user_view.dart';
import 'package:my/app/modules/tabs/tab.dart';

import '../../../scoped_model/auth.dart';
import '../../../utils/scopoed_model_helper.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('设置'),
          centerTitle: true,
          backgroundColor: GlobalColors.kPrimaryLightColor),
      body: GestureDetector(
        onTap: () {
          ScopedModelHelper.getModel<AuthModel>(context).logout();
          Get.offAll(TabNav());
          Fluttertoast.showToast(msg: "已退出登录");
        },
        child: Container(
            margin: EdgeInsets.all(8),
            height: 50,
            width: 600,
            decoration: BoxDecoration(
                color: GlobalColors.kContainerColor,
                borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: Text(
              '退出登录',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}

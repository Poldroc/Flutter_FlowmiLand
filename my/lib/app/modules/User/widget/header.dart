import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/User/setting_page.dart';
import 'package:my/app/modules/login/views/login_view.dart';
import 'package:my/utils/config.dart';
import 'package:my/scoped_model/auth.dart';
import 'package:my/utils/scopoed_model_helper.dart';

class Header extends StatelessWidget {
  const Header({super.key});
  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
              height: 75,
              width: 75,
              margin: EdgeInsets.fromLTRB(30, 20, 20, 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.ixintu.com/download/jpg/20201115/4939f541273cedfc32fa2e67fb2ede02_512_512.jpg!bg"),
              )),
          Column(
            //crossAxisAlignment: ,
            children: [
              Padding(padding: EdgeInsets.only(top: 32)),
              GestureDetector(
                  onTap: () {
                    Get.to(LoginView());
                  },
                  child: Text('点我登录', style: TextStyle(color: Colors.grey))),
              Text(
                '未登录',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    var userInfo = ScopedModelHelper.getModel<AuthModel>(context).userInfo;

    String? userName = userInfo?.username;
    print('用戶名');
    String userImage = Config.BaseUrl+userInfo!.avator_address;

    return Container(
      height: 120,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
              height: 75,
              width: 75,
              margin: EdgeInsets.fromLTRB(30, 20, 20, 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userImage),
              )),
          Column(
            //crossAxisAlignment: ,
            children: [
              Padding(padding: EdgeInsets.only(top: 32)),
              GestureDetector(
                  onTap: () {},
                  child: Text('修改资料', style: TextStyle(color: Colors.grey))),
              Text(
                userName ?? '已登录用户名',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, bottom: 55),
            child: IconButton(
                onPressed: () {
                  Get.to(SettingPage());
                },
                icon: Icon(Icons.settings)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;

    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}

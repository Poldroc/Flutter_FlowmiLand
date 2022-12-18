import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/login/background.dart';
import 'package:my/app/modules/login/forgetpassword.dart';
import 'package:my/app/modules/login/input.dart';
import 'package:my/app/modules/login/password.dart';
import 'package:my/app/modules/login/textFieldContainer.dart';
import 'package:my/app/modules/signup/signUp.dart';
import 'package:my/app/modules/tabs/tab.dart';
import 'package:my/scoped_model/auth.dart';
import 'package:my/utils/dio_http.dart';
import 'package:my/utils/http_helper.dart';
import 'package:my/utils/scopoed_model_helper.dart';
import 'package:my/utils/store.dart';
import 'package:my/utils/string_is_null_or_empty.dart';

import '../../colors/global.colors.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
//登陆处理函数
  loginHandle() async {
    var username = usernameController.text;
    var password = passwordController.text;

    if (stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      Fluttertoast.showToast(msg: '用户密码不能为空!');
      return;
    }
    const url = HttpHelper.Login;
    var params = {"unknown_key": username, "pwd": password};

    var res = await DioHttp.of(context).post(url, params,AuthModel().token);

    var resMap = json.decode(res.toString());

    int status = resMap['code'];
    print("登录状态"+status.toString());
    String description = resMap['errorMsg'];
    Fluttertoast.showToast(
      msg: description,
    );
    if (status > 0) {
      String token = resMap['data']['token'];
      print(token);
      var userdata = resMap['data']['user'];
      print(userdata);
      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);

      //全局共享
      ScopedModelHelper.getModel<AuthModel>(context).initApp(token,userdata);

      Timer(Duration(seconds: 0), () {
        Fluttertoast.showToast(msg: "登陆成功");
        Get.offAll(TabNav());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Background(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 150),
        child: Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              InputField(
                onChanged: (value) {},
                controller: usernameController,
              ),
              SizedBox(
                height: 20,
              ),
              PasswordField(
                onChanged: (value) {},
                controller: passwordController,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 300),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offAll(TabNav());
                      },
                      child: Text("忘记密码?",
                          style: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: 0.7,
                child: Container(
                  height: 50,
                  width: size.width * 0.7,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  GlobalColors.kPrimaryLightColor),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 20, color: Colors.white))),
                          onPressed: () {
                            loginHandle(); //Get.off(TabNav());
                          },
                          child: Text("登录"))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("暂无账号? 点此 ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: Text("注册",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my/app/modules/login/roundtextfield.dart';
import 'package:my/app/modules/login/views/login_view.dart';
import 'package:my/app/modules/signup/codetextfield.dart';
import 'package:my/utils/http_helper.dart';
import 'package:my/utils/string_is_null_or_empty.dart';

import '../../../utils/dio_http.dart';
//import 'package:my/utils/dio_http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();
  var addressController = TextEditingController();
  var telephonenumberController = TextEditingController();
  var emailController = TextEditingController();
  var veificationController = TextEditingController();
  var sexController = TextEditingController();
  var signatureController = TextEditingController();
  _signUpHander() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    var address = addressController.text;
    var telephonenumber = telephonenumberController.text;
    var email = emailController.text;
    var veification = veificationController.text;
    var sex = sexController.text;
    var signature = signatureController.text;
    if (password != repeatPassword) {
      Fluttertoast.showToast(msg: '两次输入的密码不一致');
      return;
    }
    if (username == null || password == null) {
      Fluttertoast.showToast(msg: '用户名或密码不能为空!');
      return;
    }
    const url = HttpHelper.Sign_Up; //网络请求
    var params = {
      'username': username,
      "tel": telephonenumber,
      "email": email,
      "sex": sex,
      "address": address,
      "signature": signature,
      "pwd": password,
      "code": veification
    }; //参数

    var res = await DioHttp.of(context).post(url, params);
    var resString = json.decode(res.toString());

    int status = resString['code'];
    print(status);
    String description = resString['errorMsg'] ?? '内部错误';
    Fluttertoast.showToast(msg: description);
    if (status.toString().startsWith('1')) {
      Fluttertoast.showToast(msg: "注册成功");
      Get.off(LoginView());
    }
  }

   _sendCode() async {
    var email = emailController.text;
    if (stringIsNullOrEmpty(email)) {
      Fluttertoast.showToast(msg: '邮箱不能为空!');
      return;
    }
    const url = "/api/v1/email/send/";
    var params = {'email': email};
    var res = await DioHttp.of(context).post(url, params);
    var resString = json.decode(res.toString());
    int status = resString['code'];
    //print(status);
    String description = resString['showMsg'] ?? '内部错误';

    if (status.toString().startsWith('1')) {
      Fluttertoast.showToast(msg: '验证码发送成功');
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
      child: Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedInputField(
                controller: usernameController,
                //labelText: "用户名",
                hintText: "输入用户名",
                onChanges: (value) {},
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                  controller: passwordController,
                  //labelText: "密码",
                  hintText: "输入密码",
                  onChanges: (value) {},
                  obscureText: true),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                  controller: repeatPasswordController,
                  //labelText: "确认密码",
                  hintText: "再次输入密码",
                  onChanges: (value) {},
                  obscureText: true),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                  controller: sexController,
                  hintText: "性别",
                  onChanges: (value) {},
                  obscureText: false),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                  controller: signatureController,
                  hintText: "输入签名",
                  onChanges: (value) {},
                  obscureText: false),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                  controller: addressController,
                  //labelText: "地址",
                  hintText: "输入地址",
                  onChanges: (value) {},
                  obscureText: false),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                  controller: telephonenumberController,
                  //labelText: "手机号码",
                  hintText: "输入手机号码",
                  onChanges: (value) {},
                  obscureText: false),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                  controller: emailController,
                  //labelText: "电子邮箱",
                  hintText: "输入电子邮箱",
                  onChanges: (value) {},
                  obscureText: false),
              codeTextField(
                mController: veificationController, 
                email: emailController.text,
              ),
              /* RoundedInputField(
                  controller: veificationController,
                  //labelText: "验证码",
                  hintText: "输入验证码",
                  onChanges: (value) {},
                  obscureText: false), */
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: size.width * 0.5,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 20, color: Colors.white))),
                        onPressed: () {
                          _signUpHander();
                        },
                        child: Text("成为新用户"))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("已有账号? 点此 ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                      onTap: () {
                        Get.off(LoginView());
                      },
                      child: Text("登录",
                          style: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/dio_http.dart';
import '../../../utils/string_is_null_or_empty.dart';

class codeTextField extends StatefulWidget {
  codeTextField({
    Key? key,
    required this.mController,
    required this.email,
  }) : super(key: key);
  final TextEditingController mController;
  final String email;

  @override
  State<codeTextField> createState() => _codeTextFieldState();
}

class _codeTextFieldState extends State<codeTextField> {
  _sendCode() async {
    var email = widget.email;
    print(email);
    if (stringIsNullOrEmpty(email)) {
      Fluttertoast.showToast(msg: '邮箱不能为空!');
      return;
    }
    const url = "http://182.61.52.110:5000/api/v1/email/send/";
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

  bool isButtonEnable = true; //按钮初始状态  是否可点击
  String buttonText = '发送验证码'; //初始文本
  int count = 10; //初始倒计时时间
  Timer? timer; //倒计时的计时器

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
//农用地        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      const Text('邮箱验证码',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xff333333))),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                         child: TextFormField(
                            maxLines: 1,
                            onSaved: (value) {},
                            controller: widget.mController,
                            textAlign: TextAlign.start,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")), //只允许输入0-9的数字
                              LengthLimitingTextInputFormatter(4) //最大输入长度为6
                            ],
                            decoration: const InputDecoration(
                              hintText: ('填写验证码'),
                              // fillColor: Colors.red,  //设置TextFormField背景颜色
                              // filled: true,
                              contentPadding:
                                  EdgeInsets.only(top: 25, bottom: 0),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                              alignLabelWithHint: true,

                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: isButtonEnable
                                  ? MaterialStateProperty.all<Color>(
                                      Color(0xff44c5fe))
                                  : MaterialStateProperty.all<Color>(
                                      Colors.grey.withOpacity(0.1)) //钮禁用时的颜色
                              ),
                          onPressed: () {
                            if (isButtonEnable) {
                              _sendCode();
                              debugPrint('$isButtonEnable');
                              setState(() {
                                _buttonClickListen();
                              });
                            }
                          },
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              color: isButtonEnable
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.2), //文本颜色
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ]));
  }

  void _buttonClickListen() {
    setState(() {
      if (isButtonEnable) {
        //当按钮可点击时
        isButtonEnable = false; //按钮状态标记
        _initTimer();
      }
    });
  }

  void _initTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      count--;
      setState(() {
        if (count == 0) {
          timer.cancel(); //倒计时结束取消定时器
          isButtonEnable = true; //按钮可点击
          count = 5; //重置时间
          buttonText = '发送验证码'; //重置按钮文本
        } else {
          buttonText = '重新发送($count)'; //更新文本内容
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); //销毁计时器
    timer = null;
    widget.mController.dispose();
    super.dispose();
  }
}

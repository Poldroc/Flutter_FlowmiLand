import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my/app/modules/login/body.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(width: double.infinity,
      height: double.infinity,
      child: Stack(children: [Body()]),
      )
     
      
    );
  }
}

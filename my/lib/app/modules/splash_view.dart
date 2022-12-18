import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/login/views/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
        Duration(
          seconds: 2,
        ), (timer) {
      Get.off(
        LoginView(),
      );
      timer.cancel();
      return;
    });
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "images/open.jpg",
          fit: BoxFit.contain,
        ));
    // body: Center(
    //     child: Text(
    //   'Logo',
    //   style: TextStyle(
    //       color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    // )),
  }
}

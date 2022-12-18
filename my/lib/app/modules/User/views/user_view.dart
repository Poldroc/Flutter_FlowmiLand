import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my/app/modules/User/widget/header.dart';
import 'package:my/app/modules/User/widget/myQuestion.dart';
import 'package:my/app/modules/User/widget/user_select.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        Header(),
        UserSelectRow(),
        MyQuestionContainer()
        
        ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my/app/colors/global.colors.dart';

import '../../../../scoped_model/auth.dart';
import '../../../../utils/scopoed_model_helper.dart';

class UserSelectRow extends StatefulWidget {
  const UserSelectRow({super.key});

  
  @override
  State<UserSelectRow> createState() => _UserSelectRowState();
}

class _UserSelectRowState extends State<UserSelectRow> {
  
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;
    bool isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: isLogin? Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Image.asset(
                "images/myfollow.png",
                width: size.width * 0.2,
              ),
            ),
            GestureDetector(
              child: Image.asset(
                "images/browse.png",
                width: size.width * 0.2,
              ),
            ),
            GestureDetector(
              child: Image.asset("images/order.png", width: size.width * 0.2),
            ),
            GestureDetector(
              child: Image.asset(
                "images/question.png",
                width: size.width * 0.2,
              ),
            ),
          ],
        ),
      ):Container()
    );
  }
}

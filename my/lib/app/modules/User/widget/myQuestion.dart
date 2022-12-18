

import 'package:flutter/material.dart';

import '../../../../scoped_model/auth.dart';
import '../../../../utils/scopoed_model_helper.dart';
import '../../../colors/global.colors.dart';

class MyQuestionContainer extends StatefulWidget {
  const MyQuestionContainer({super.key});

  @override
  State<MyQuestionContainer> createState() => _MyQuestionContainerState();
}

class _MyQuestionContainerState extends State<MyQuestionContainer> {
  @override
  Widget build(BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    Size size = MediaQuery.of(context).size;
    return isLogin? GestureDetector(
        onTap: () {
          
        },
        child: 
            Container(
                width: size.width * 0.8,
                height: size.height * 0.35,
                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                decoration: BoxDecoration(
                    color: GlobalColors.kPolicyContainer,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: GlobalColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            height: 35,
                            width: 8,
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            "我的问答",
                            style: TextStyle(
                                color: GlobalColors.kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: size.width * 0.48),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      )]))):Container();
  }
}
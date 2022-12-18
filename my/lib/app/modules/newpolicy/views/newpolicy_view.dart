import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../colors/global.colors.dart';
import '../controllers/newpolicy_controller.dart';
import '../widget/policyListView.dart';

class NewpolicyView extends GetView<NewpolicyController> {
  const NewpolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 25.0, top: 12, bottom: 12, right: 25),
          child: Container(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: GlobalColors.kPrimaryColor)),
          ),
        ),
        title: const Text('最新政策',
            style: TextStyle(color: Color.fromARGB(255, 3, 71, 5))),
      ),
      body: /* RefreshIndicator(
        child: */ buildPolicyListView(),
        //onRefresh: _handlerRefresh,
    );
    //);
  }
}

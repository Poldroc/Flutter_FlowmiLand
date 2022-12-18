import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my/app/widget/common_image.dart';

import '../../../data/newPolicyList.dart';
import 'getRow.dart';

List<NewPolicyList> list = policydata;

Widget buildPolicyListView() {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: ((context, index) {
      if (list[index] == null) {
        //显示加载更多
        return Container(
            alignment: Alignment.center,
            height: 40,
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ));
      } else {
        return getRow(index);
      }
    }),
    //controller: _scrollController,
  );
}

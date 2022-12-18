import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my/app/modules/newpolicy/widget/policyListView.dart';

import '../../../data/newPolicyList.dart';
import '../../../widget/common_image.dart';

Widget getRow(int index) {
  NewPolicyList item = list[index];
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10, bottom: 10),
    child: Column(
      children: [
        Row(
          children: [
            CommonImage(
                src: item.policyImage,
                fit: BoxFit.cover,
                height: 200,
                width: 100),
            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 0, right: 10, bottom: 12),
                    child: Text(
                      item.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    decoration: BoxDecoration(),
                    child: Text(
                      item.content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(color: Colors.grey)
      ],
    ),
  );
}

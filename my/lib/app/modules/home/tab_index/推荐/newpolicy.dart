import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/add/widget/tags.dart';
import 'package:my/app/modules/newpolicy/views/newpolicy_view.dart';

import '../../../../data/newPolicyList.dart';

class NewMessageContainer extends StatefulWidget {
  const NewMessageContainer({super.key});

  @override
  State<NewMessageContainer> createState() => NewMessageContainerState();
}

class NewMessageContainerState extends State<NewMessageContainer> {
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isIndex = false;

    List<NewPolicyList> list = policydata;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          Get.to(NewpolicyView());
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            "最新政策",
                            style: TextStyle(
                                color: GlobalColors.kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: size.width * 0.48),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                      smallPolicyContaner(
                        width: size.width - 40,
                        height: size.height * 0.06,
                        color: GlobalColors.kPrimaryLightColor,
                        
                        index: 0,
                        size: size,
                      ),
                      smallPolicyContaner(
                        width: size.width * 0.85 - 40,
                        height: size.height * 0.06,
                        color: Colors.white,
                        size: size,
                        index: list.length > 1 ? 1 : 0,
                      ),
                      smallPolicyContaner(
                        width: size.width * 0.85 - 40,
                        height: size.height * 0.06,
                        color: Colors.white,
                        size: size,
                        index: list.length > 1 ? 2 : 0,
                      ),
                    ])));
  }
}

class smallPolicyContaner extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final int index;
  const smallPolicyContaner({
    Key? key,
    required this.size,
    required this.index,
    required this.width,
    required this.height, required this.color,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3, bottom: 3),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                policydata[index].title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3, bottom: 3),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                policydata[index].content,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}

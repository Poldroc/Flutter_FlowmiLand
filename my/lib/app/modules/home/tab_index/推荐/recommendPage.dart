import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/home/tab_index/%E6%8E%A8%E8%8D%90/card.dart';
import 'package:my/app/modules/home/tab_index/%E6%8E%A8%E8%8D%90/newpolicy.dart';
import 'package:my/app/data/recommendList.dart';

import '../../../../colors/global.colors.dart';
import '../../controllers/home_controller.dart';
var c = Get.put(HomeController());
class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  //List<Widget> listViews = <Widget>[];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        EasyRefresh(
          controller: c.easyRefreshController,
          onRefresh: c.onRefresh,
          onLoad: c.onLoad,
          
          child: 
         ListView(
            children: [
            NewMessageContainer(), 
            SizedBox(height: 40,),
            CardListView()]),)
      
    );
  }
}
 /* children: recdataList
                .map((item) => Card(
                      margin: EdgeInsets.all(10),
                      child: Column(children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                        )
                      ]),
                    ))
                .toList(), */
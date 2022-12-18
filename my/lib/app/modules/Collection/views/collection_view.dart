import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/data/LandDetailDefaultdata.dart';
import 'package:my/app/modules/Collection/state/collection_state.dart';
import 'package:my/app/modules/add/landManage/Land_manageView.dart';
import 'package:my/font/font.dart';

import '../../../data/collectionList.dart';
import '../../../widget/collect_land_item.dart';
import '../../../widget/list_item_widget.dart';

import '../controllers/collection_controller.dart';

var controller = Get.put(CollectionController());

class CollectionView extends GetView<CollectionController> {
  const CollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(
                left: 25.0, top: 12, bottom: 12, right: 25),
            child: Container(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: GlobalColors.kPrimaryColor)),
            ),
          ),
          title: const Text('我的收藏',
              style: TextStyle(color: Color.fromARGB(255, 3, 71, 5))),
        ),
        body: GetX<CollectionController>(
          init: CollectionController(),
          initState: (_) {},
          builder: (_) {
            return EasyRefresh(
                controller: controller.easyRefreshController,
                onRefresh: controller.onRefresh,
                onLoad: controller.onLoad,
                child: ListView.builder(
                    itemCount: controller.state.data.length,
                    itemBuilder: ((context, index) {
                      return CollectLandListItemWidget(
                          controller.state.data[index]);
                    })));
          },
        ));
  }
}

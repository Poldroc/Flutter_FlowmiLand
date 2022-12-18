import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/Collection/state/collection_state.dart';
import 'package:my/models/Collect_Land_Detail.dart';

import '../../../../main.dart';
import '../../../../scoped_model/auth.dart';
import '../../../../utils/dio_http.dart';
import '../../../../utils/http_helper.dart';
import '../../../../utils/scopoed_model_helper.dart';

BuildContext context = navigatorKey.currentState!.overlay!.context;

class CollectionController extends GetxController {
  //TODO: Implement CollectionController

  final state = CollectState();
  final count = 0.obs;
  late EasyRefreshController easyRefreshController;
  int page = 1;
  bool hasMore = true;
  bool error = false;
  String errorMsg = '';
  var uid = ScopedModelHelper.getModel<AuthModel>(context).userInfo!.uid;
  var token = ScopedModelHelper.getModel<AuthModel>(context).token;

  Future<void> _getCollectLand() async {
    var url = HttpHelper.Get_Collect_Land;

    try {
      print("传入的page" + page.toString());
      var res = await DioHttp.of(context).get(
        url,{"uid":uid,"token":token,"page":page.toString(),"per_page":1}
      );

      var resMap = json.decode(res.toString());

      int status = resMap['code'];
      var pages = resMap["data"]["pagination"]["pages"];

      hasMore = page <= pages;

      print("page" + page.toString());

      if (hasMore) {
        var list = [];

        list = resMap['data']['list'] as List;

        list.forEach((element) {
          print(element);
          state.data.add(CollectLandDetailData.fromJson(element));
        });
        update();
      } else {
        //state.data=
      }
    } on Exception catch (e) {
      error = true;
      errorMsg = e.toString();
    }
  }

  //下拉刷新
  Future<void> onRefresh() async {
    page = 1;
    state.data.clear();
    await _getCollectLand();
    easyRefreshController.finishRefresh();
  }

  //上拉加载
  Future<void> onLoad() async {
    print("开始onload");
    if (hasMore) {
      page++;
      await _getCollectLand();
    }

    easyRefreshController.finishLoad();
  }

  @override
  void onInit() {
    super.onInit();
    print("开始");
    easyRefreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    _getCollectLand();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  @override
  void dispose() {
    super.dispose();
    // dispose 释放对象
    easyRefreshController.dispose();
  }
}

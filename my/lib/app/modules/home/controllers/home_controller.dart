import 'dart:convert';


import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../models/Land_Detail.dart';
import '../../../../utils/dio_http.dart';
import '../../../../utils/http_helper.dart';

import '../state/home_state.dart';

BuildContext context = navigatorKey.currentState!.overlay!.context;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final state = HomeState();
  final count = 0.obs;
  late EasyRefreshController easyRefreshController;
  int page = 1;
  bool hasMore = true;
  bool error = false;
  String errorMsg = '';

  Future<void> _loadData() async {
    var url = HttpHelper.Get_Land;

    try {
      print("传入的page" + page.toString());
      var res = await DioHttp.of(context).get(url, {"page": page});

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
          state.data.add(LandDetailData.fromJson(element));
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
    await _loadData();
    easyRefreshController.finishRefresh();
  }

  //上拉加载
  Future<void> onLoad() async {
    print("开始onload");
    if (hasMore) {
      page++;
      await _loadData();
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
    _loadData();
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

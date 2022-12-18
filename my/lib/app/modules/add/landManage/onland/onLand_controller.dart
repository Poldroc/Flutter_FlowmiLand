import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../main.dart';
import '../../../../../utils/dio_http.dart';
import '../../../../../utils/http_helper.dart';


class landManage_Controller extends GetxController {
  BuildContext context = navigatorKey.currentState!.overlay!.context;
  /* RxList<LandDetailData> data = <LandDetailData>[].obs;

  int page = 1;
  int _per_page = 6;
  String _query_type = "by_time";

  bool _isLoading = false; */

/*   //加载更多
  void loadmore() {
    if (!_isLoading) {
      _isLoading = true;
      page++;
      loadingNetData();
    }
  }
 */
 /*  //异步加载
  Future<void> loadingNetData() async {
    String url = HttpHelper.Get_Land;

    //添加分页请求数据
    Map<String, dynamic> map = Map();
    //当前页数
    map["page"] = page;
    //每页大小
    map["per_page"] = _per_page;
    //查询方式
    map["query_type"] = _query_type;

    var res = await DioHttp.of(context).get(url, map);

    var resMap = json.decode(res.toString());

    int status = resMap['code'];
    int pages = resMap['data']['pagination']['pages'];
    print("status:" + status.toString());

    print("pages:" + pages.toString());

    //加载结束标识
    _isLoading = false;

    if (status == 1) {
      var list = resMap['data']['list'] as List;
      if (list.length == 0 && page != 1) {
        page--;
      }

      if (page == 1) {
        //清空一下数据
        data =<LandDetailData> [].obs;
      }

      /* List<LandDetailData>?  data =
          list.map((i) => LandDetailData?.fromJson(i)).toList();*/

       list.forEach((element) {
        data.add(LandDetailData.fromJson(element));
      });
      
    } else {
      Fluttertoast.showToast(msg: "请求失败");
    }
  } */

  @override
  void onInit() {
    super.onInit();


    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

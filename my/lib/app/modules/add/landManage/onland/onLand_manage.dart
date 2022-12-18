import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/add/landManage/Land_manageView.dart';
import 'package:my/app/modules/newpolicy/widget/policyListView.dart';
import 'package:my/utils/dio_http.dart';
import 'package:my/utils/http_helper.dart';

import '../../../../../models/Land_Detail.dart';
import '../../../../colors/global.colors.dart';
import '../../../../widget/list_item_widget.dart';

import 'onLand_controller.dart';
List<LandDetailData> data = [];
class OnlandManage extends StatefulWidget {
  OnlandManage({super.key});
  

  @override
  State<OnlandManage> createState() => _OnlandManageState();
}

class _OnlandManageState extends State<OnlandManage> {
  final c = Get.put(landManage_Controller());
  final controller = Get.find<landManage_Controller>();

  @override
  void initState() {
    super.initState();
    loadingNetData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //每一个滑动组件,在滑动是都会发出通知
      //在这只监听了滑动结束的通知
      //滑动监听
      NotificationListener<ScrollEndNotification>(
        onNotification: (ScrollEndNotification notification) {
          //滑动结束时 判断下如果滑动了2/3数据
          //就自动加载下一页数据
          //获取滑动距离
          //ScrollMetrics 是保存滑动相关的信息
          //pixels
          ScrollMetrics scrollMetrics = notification.metrics;
          //获取滑动的距离
          double pixels = scrollMetrics.pixels;
          //获取最大滑动距离
          double maxPixels = scrollMetrics.maxScrollExtent;
          //获取滑动方向
          AxisDirection axisDirection = scrollMetrics.axisDirection;

          if (pixels >= maxPixels / 3 * 2) {
            //加载更多
            loadmore();
          }

          //返回true,阻止再向上发送通知
          return true;
        },
        //下拉刷新
        child: RefreshIndicator(
            onRefresh: () {
              return onRefresh();
            },
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  if (data[index] == null) {
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
                    
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: LandListItemWidget(
                        data[index],
                      ),
                    );
                  }
                }))),
      ),

      Positioned(
          width: MediaQuery.of(context).size.width,
          height: 70,
          bottom: 0,
          child: Container(
              color: Colors.transparent,
              padding:
                  EdgeInsets.only(top: 12, right: 20, left: 20, bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '下架土地',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ]),
                          ),
                        )),
                  ),
                ],
              )))
    ]);
  }

  @override
  bool get wantKeepAlive => true;

  int _page = 1;
  int _per_page = 6;
  String _query_type = "by_time";

  bool _isLoading = false;
  //加载更多
  void loadmore() {
    if (!_isLoading) {
      _isLoading = true;
      _page++;
      loadingNetData();
    }
  }

  //异步加载
  Future<void> loadingNetData() async {
    String url = HttpHelper.Get_Land;

    //添加分页请求数据
    Map<String, dynamic> map = Map();
    //当前页数
    map["page"] = _page;
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
      if (list.length == 0 && _page != 1) {
        _page--;
      }

      if (_page == 1) {
        //清空一下数据
        data = [];
      }

      /* List<LandDetailData>?  data =
          list.map((i) => LandDetailData?.fromJson(i)).toList();*/

      list.forEach((element) {
        data.add(LandDetailData.fromJson(element));
      });
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: "请求失败");
    }
  }

  int _preLoadingTime = 0;
  //下拉刷新
  Future<bool> onRefresh() async {
    //重置页数
    _page = 1;

    _preLoadingTime = DateTime.now().microsecond;
    //加载数据
    await loadingNetData();
    //加载完的时间
    int current = DateTime.now().microsecond;
    //时间差
    int flagTime = current - _preLoadingTime;
    //最少显示1秒
    if (flagTime < 1000) {
      await Future.delayed(Duration(milliseconds: 1000 - flagTime));
    }
    Fluttertoast.showToast(msg: "已刷新", gravity: ToastGravity.TOP);

    return true;
  }
}

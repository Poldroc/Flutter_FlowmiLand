import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:my/app/modules/newpolicy/widget/policyListView.dart';
import 'package:my/utils/http_helper.dart';

import '../../../../../main.dart';
import '../../../../../models/Land_Detail.dart';
import '../../../../../utils/dio_http.dart';
import '../../../../widget/list_item_widget.dart';

class LandSearch extends SearchDelegate<String> {
  String searchHint = "请输入搜索内容...";
  List<String> list = [];
  

  var typeList = [];

  //List<LandDetailData> data = [];

  @override
  String get searchFieldLabel => searchHint;

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context,'');
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  ///展示搜索结果
  @override
  Widget buildResults(BuildContext context) {
    
    return FutureBuilder(
        future: _loadData(query),
        builder: (context, AsyncSnapshot snapshot) {
          /*  return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: data?.length == 0 ? 1 : data.length,
              itemBuilder: (BuildContext context, int index) {
                if (data.length > 0) {
                  return LandListItemWidget(
                    data[index],
                  );
                } else {
                  return Container();
                }
              }); */
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Container(
                child: Text("未找到..."),
              );
            // 当前没有连接到任何的异步任务
            case ConnectionState.waiting:
            // 连接到异步任务并等待进行交互
            case ConnectionState.active:
              print("--------->loading");
              return Container(
                child: Center(
                  child: Text("加载数据中..."),
                ),
              );
            // 连接到异步任务并开始交互
            case ConnectionState.done:
              print("--------->done");
              if (snapshot.hasError) {
                print("--------->error");
                return Container(
                  child: Center(
                    child: Text("加载数据失败"),
                  ),
                );
              } else if (snapshot.hasData) {
                print("--------->data");
                return ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.data.length > 0) {
                        return LandListItemWidget(snapshot.data[index]
                            //data[index],
                            );
                      } else {
                        return Container(
                          child: Text("未找到..."),
                        );
                      }
                    });
              }
          }
          return Container(
            child: Text("未找到..."),
          );
        });
  }

  BuildContext context = navigatorKey.currentState!.overlay!.context;

  @override
  Widget buildSuggestions(BuildContext context) {
    var filterList = list.where((String s) => s.contains(query.trim()));
     return ListView(
      children: <Widget>[
        for (String item in filterList)
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              item,
              //style: Theme.of(context).textTheme.title,
            ),
            onTap: () {
              //close(context, item);
            },
          ),
      ],
    );

    
  }

  Future<List<LandDetailData>> _loadData(String keyword) async {
    List<LandDetailData> data = [];
    print("keyword:" + keyword);
    var url = HttpHelper.Get_Land;
    Dio dio = Dio();

    var res = await DioHttp.of(context)
        .get(url, {"query_type": "by_keyword", "keyword": keyword});

    var resMap = json.decode(res.toString());
    int status = resMap['code'];
    if (status == 1) {
      var list = [];
      list = resMap['data']['list'] as List;

      list.forEach((element) {
        print(element);
        data.add(LandDetailData.fromJson(element));
      });
      if (data.length > 0)
        return data;
      else {
        Fluttertoast.showToast(msg: "未找到...");
        return data;
      }
    } else {
      Fluttertoast.showToast(msg: "加载失败...");
      return data;
    }
  }
}

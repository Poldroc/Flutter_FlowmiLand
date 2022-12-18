import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/home/tab_index/%E6%8E%A8%E8%8D%90/newpolicy.dart';
import 'package:my/app/modules/home/tab_index/%E6%8E%A8%E8%8D%90/recommendPage.dart';
import 'package:my/app/modules/home/tab_index/search.dart';

import '推荐/card.dart';
import '订阅/view/focus_view.dart';

class TopTabBar extends StatefulWidget {
  const TopTabBar({super.key});

  @override
  State<TopTabBar> createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //生命周期函数:组件初始化时就会触发
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    //监听_tabController的改变事件
    _tabController.addListener(() {
      //_tabController.index;//获取两次,无法实现功能
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //销毁_tabController
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // //配置appbar的高度
        preferredSize: Size.fromHeight(120),
        // child: Column(
        //   children: [
        child: Opacity(
          opacity: 0.9,
          child: AppBar(
              elevation: 5,
              backgroundColor: GlobalColors.kPrimaryColor,
              bottom: TabBar(
                  //padding: EdgeInsets.all(1),
                  //isScrollable: true,//可滚动
                  indicatorColor: Colors.white,
                  indicatorWeight: 2,
                  //indicatorPadding: EdgeInsets.all(10),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 30),
                  unselectedLabelStyle: TextStyle(fontSize: 20),
                  //indicator: BoxDecoration(
                  //color:Colors.blue
                  //),
                  //指示器与label等长
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      child: Text("推荐"),
                    ),
                    Tab(
                      child: Text("订阅"),
                    ),
                  ]),
              title: RootPageHead()),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // KeepAliveWrapper(//自定义的缓存组件
          /* child: */ RecommendPage(),

          FocusView()
        ],
      ),
    );
  }
}

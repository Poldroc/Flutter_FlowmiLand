import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/add/landManage/onland/onLand_manage.dart';

import '../../../widget/list_item_widget.dart';
import '../../../data/LandDetailDefaultdata.dart';


List<LandDetailData> data = defaultList;
class LandSettingTabbarView extends StatefulWidget {
   LandSettingTabbarView({Key? key}) : super(key: key);

  @override
  _LandSettingTabbarViewState createState() => _LandSettingTabbarViewState();
   
}

class _LandSettingTabbarViewState extends State<LandSettingTabbarView>with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  List<String> tabs =['已上架','下架中','审核中','审核未通过'];
  late TabController tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:GlobalColors.kPrimaryLightColor,
        title: Text('土地管理',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
        bottom:TabBar(
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            labelColor: Colors.white,
            // indicatorSize:TabBarIndicatorSize.label,
            indicator:const UnderlineTabIndicator(),
            controller: tabController,
            tabs: tabs.map((e){
              return Tab(text: e,);
            }).toList()) ,
      ),
      body: TabBarView(
        controller:tabController,
        children: [ //OnLandListsPage(),
       OnlandManage(), 
        Container(),
        Container(),
        Container(),
        //
        //OnlandManage(data: data,),
        //OnlandManage(data: data,),
        //OnlandManage(data: data,),
       
        //OnLandListsPage(),
        //OnLandListsPage(),

        // OnLandListsPage(),

      ]),
    );
  }
  
  @override

  bool get wantKeepAlive => true;
}


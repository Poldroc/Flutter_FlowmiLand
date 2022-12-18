import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my/app/modules/home/tab_index/%E6%8E%A8%E8%8D%90/newpolicy.dart';
import 'package:my/app/modules/home/tab_index/index.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  TopTabBar();
    
      
    
  }
}

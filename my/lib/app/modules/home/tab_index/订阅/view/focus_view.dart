import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../colors/global.colors.dart';
import '../controller/focus_controller.dart';
import '../find_item.dart';

class FocusView extends GetView<FocusController> {
  const FocusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return /* RefreshIndicator(
        child: */
         buildFocusListView();

      //onRefresh: _handlerRefresh,
    
    //);
  }
}

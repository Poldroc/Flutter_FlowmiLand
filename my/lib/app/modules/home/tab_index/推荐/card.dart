import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../info/item_widget.dart';

var c = Get.put(HomeController());

class CardListView extends StatefulWidget {
  CardListView({
    super.key,
  });

  @override
  State<CardListView> createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  @override
  Widget build(BuildContext context) {
    return /* Flex(
        direction: Axis.vertical,
        children: [
             Column(
              children: widget.infoList.map((item) => ItemWidget(infoData: item,)).toList(),),
           ],
         ) */
        GetX<HomeController>(
      init: c,
      initState: (_) {},
      builder: (c) {
        return /* EasyRefresh(
          controller: c.easyRefreshController,
          onRefresh: c.onRefresh,
          onLoad: c.onLoad, */
            /* child: */ StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: c.state.data.length,
          itemBuilder: ((context, index) =>
              ItemWidget(infoData: c.state.data[index])),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          staggeredTileBuilder: (int index) {
            return //StaggeredTile.count(2, index.isEven ? 2.3: 3)
                StaggeredTile.fit(2);
          },
        );
      },
    );
  }
}

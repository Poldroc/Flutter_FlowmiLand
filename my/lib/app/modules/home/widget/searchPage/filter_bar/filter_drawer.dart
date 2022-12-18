import 'package:flutter/material.dart';
import 'package:my/app/modules/home/widget/searchPage/filter_bar/data.dart';
import 'package:my/app/widget/common_title.dart';

import '../../../../../../scoped_model/room_filter.dart';
import '../../../../../../utils/scopoed_model_helper.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    ageLimitList = dataList['ageLimitList'];
    priceList = dataList['priceList'];
    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();
    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(children: [
          CommonTitle(title: "年限"),
          FilterDrawerItem(
            list: ageLimitList,
            onChange: _onChange,
            selectedIds: selectedIds,
          ),
          CommonTitle(title: "价格"),
          FilterDrawerItem(
            list: priceList,
            onChange: _onChange,
            selectedIds: selectedIds,
          ),
        ]),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType>? list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;
  const FilterDrawerItem({
    Key? key,
    required this.list,
    required this.selectedIds,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list!.map((item) {
          var isActive = selectedIds.contains(item.id);
          return GestureDetector(
            onTap: (() {
              if (onChange != null) onChange(item.id);
            }),
            behavior: HitTestBehavior.translucent,
            child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: isActive ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.green)),
                child: Center(
                  child: Text(
                    item.name,
                    style: TextStyle(
                        color: isActive ? Colors.white : Colors.green),
                  ),
                )),
          );
        }).toList(),
      ),
    );
  }
}

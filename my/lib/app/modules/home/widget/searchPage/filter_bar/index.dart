import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:my/app/modules/add/widget/common_image_picker.dart';
import 'package:my/app/modules/home/widget/searchPage/filter_bar/data.dart';
import 'package:my/app/modules/home/widget/searchPage/filter_bar/item.dart';
import 'package:my/app/widget/common_picker.dart';
import 'package:my/scoped_model/room_filter.dart';
import 'package:my/utils/scopoed_model_helper.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({super.key, required this.onChange});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isLocationActive = false;
  bool isTypeActive = false;
  bool isAreaActive = false;
  bool isFilterActive = false;

  String locationId = '';
  String typeId = '';
  String areaId = '';
  List<String> moreIds = [];

  _onLocationChange(context) {
    setState(() {
      isLocationActive = true;
    });
    /* String initProvince = '福建省', initCity = '福州市', initTown = '';
    Pickers.showAddressPicker(context,
        initProvince: initProvince,
        initCity: initCity,
        initTown: initTown, onConfirm: (p, c, t) {
      setState(() {
        initProvince = p;
        initCity = c;
        initTown = t!;
        isLocationActive = false;
      });
    }, onCancel: (isCancel) {
      setState(() {});
      isLocationActive = false;
    }, onChanged: _onChange()); */
    var result = CommonPicker.showPicker(
        value: -1,
        context: context,
        options: locationList!.map((item) => item.name).toList());

    result.then((index) {
      if (index == null) return;
      setState(() {
        locationId = locationList![index].id;
      });
      _onChange();
    }).whenComplete(() => setState(() {
          isLocationActive = false;
        }));
    print(result);
  }

  _onTypeChange(context) {
    setState(() {
      isTypeActive = true;
    });
    /* var initData = typeList![1];
    var result = Pickers.showSinglePicker(context,
        data: typeList, selectData: initData, onConfirm: (p, position) {
      setState(() {
        initData = p;
        typeId = position;
      });
      isTypeActive = false;
    }, onCancel: (isCancel) {
      setState(() {});
      isTypeActive = false;
    }, onChanged: _onChange()); */
    var result = CommonPicker.showPicker(
        value: -1,
        context: context,
        options: typeList!.map((item) => item.name).toList());

    result.then((index) {
      if (index == null) return;
      setState(() {
        typeId = typeList![index].id;
      });
      _onChange();
    }).whenComplete(() => setState(() {
          isTypeActive = false;
        }));
  }

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    /* var initData = areaList![0];
    var result = Pickers.showSinglePicker(
      context,
      data: areaList,
      selectData: initData,
      onConfirm: (p, position) {
        setState(() {
          initData = p;
          areaId = position;
        });

        isAreaActive = false;
      },
      onCancel: (isCancel) {
        setState(() {});
        isAreaActive = false;
      },
      onChanged: _onChange(),
    ); */
    var result = CommonPicker.showPicker(
        value: -1,
        context: context,
        options: areaList!.map((item) => item.name).toList());

    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList![index].id;
      });
      _onChange();
    }).whenComplete(() => setState(() {
          isAreaActive = false;
        }));
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  _onChange() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange(FilterBarResult(
        areaId: areaId,
        locationId: locationId,
        typeId: typeId,
        moreIds: selectedList.toList(),
      ));
      print('sss'+locationId+typeId+areaId);
    }
  }

  _getData() {
    //设置了可选的选项
    Map<String, List<GeneralType>?> dataList =
        Map<String, List<GeneralType>?>();
    dataList['ageLimitList'] = ageLimitList;
    dataList['priceList'] = priceList;
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(_getData);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Item(title: '位置', isActive: isLocationActive, onTap: _onLocationChange),
        Item(title: '类型', isActive: isTypeActive, onTap: _onTypeChange),
        Item(title: '面积', isActive: isAreaActive, onTap: _onAreaChange),
        Item(title: '筛选', isActive: isFilterActive, onTap: _onFilterChange),
      ]),
    );
  }
}

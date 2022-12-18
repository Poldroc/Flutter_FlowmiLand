

import 'package:flutter/material.dart';
import 'package:my/app/modules/home/widget/searchPage/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';

//model基本结构
class FilterBarModel extends Model {
  List<GeneralType>? _ageLimitList = [];
  List<GeneralType>? _priceList = [];

  Set<String> _selectedList = Set<String>();
  //获取可选取数据列表
  Map<String, List<GeneralType>?> get dataList {
    var result = Map<String, List<GeneralType>?>();
    result['ageLimitList'] = _ageLimitList;
    result['priceList'] = _priceList;

    return result;
  }

  //添加可选数据列表
  set dataList(Map<String, List<GeneralType>?> data) {
    _ageLimitList = data['ageLimitList'];
    _priceList = data['priceList'];

    notifyListeners(); //拿到set的数据转到上面的model,再通过get方法取得数据
  }

  //获取选中数据列表
  Set<String> get selectedList {
    return _selectedList;
  }

  //两种状态,选中点后取消/未选中点后选中
  selectedListToggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
    notifyListeners();
  }
}

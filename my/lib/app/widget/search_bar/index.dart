import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/home/views/home_view.dart';
import 'package:my/app/modules/tabs/tab.dart';
import 'package:my/app/widget/common_image.dart';
import 'package:my/font/font.dart';

class SearchBar extends StatefulWidget {
  final bool showLoaction; //展示位置按钮
  final Function goBackcallback; //回退按钮函数
  final String inputValue; //搜索框输入值
  final String dafaultInputValue; //搜索框默认值
  final Function onCancel; //取消按钮
  final bool showMap; //展示地图按钮
  final Function onSearch; //用户点击搜索框触发
  final ValueChanged<String> onSearchSubmit; //用户输入搜素词,点击键盘搜索键触发

  const SearchBar({
    super.key,
    required this.showLoaction,
    required this.goBackcallback,
    this.inputValue = '',
    this.dafaultInputValue = "请输入搜索词",
    required this.onCancel,
    required this.showMap,
    required this.onSearch,
    required this.onSearchSubmit,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  TextEditingController? _controller;
  Function? _onClean() {
    _controller?.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      if (widget.showLoaction != null)
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {},
            child: Row(children: [
              Icon(
                Icons.location_on,
                color: Colors.green,
                size: 19,
              ),
              Text(
                '福建',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14),
              )
            ]),
          ),
        ),
      if (widget.goBackcallback != null)
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: (() => widget.goBackcallback),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
              ),
              color: Colors.black87,
              onPressed: () {
                Get.offAll(TabNav());
              },
            ),
          ),
        ),
      Expanded(
        child: Container(
          height: 34,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(17)),
          margin: const EdgeInsets.only(right: 10),
          child: TextField(
            onTap: (() => widget.onSearch),
            onSubmitted: (value) => widget.onSearchSubmit,
            textInputAction: TextInputAction.search,
            controller: _controller,
            style: TextStyle(
              fontSize: 16,
            ),
            onChanged: ((value) {
              setState(() {
                _searchWord = value;
              });
            }),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入搜索词',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                contentPadding: EdgeInsets.only(left: -20, top: -1, bottom: 5),
                suffixIcon: GestureDetector(
                  onTap: (() {
                    _onClean();
                  }),
                  child: Icon(
                    Icons.clear,
                    size: 18,
                    color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.grey,
                  ),
                )),
          ),
        ),
      ),
      if (widget.onCancel != null)
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: (() => widget.onCancel),
            child: Text(
              "取消",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ),
        ),
      if (widget.showMap != null)
        Icon(
          myFont.getLocation,
          color: Colors.black,
          size: 22,
        )
    ]));
  }
}

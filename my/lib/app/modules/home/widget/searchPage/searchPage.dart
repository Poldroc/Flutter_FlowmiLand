import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:my/app/data/recommendList.dart';
import 'package:my/app/modules/add/landManage/Land_manageView.dart';
import 'package:my/app/modules/home/widget/searchPage/filter_bar/filter_drawer.dart';
import 'package:my/app/modules/home/widget/searchPage/filter_bar/index.dart';
import 'package:my/app/modules/home/tab_index/info/item_widget.dart';
import 'package:my/app/widget/list_item_widget.dart';

import '../../../../../models/Land_Detail.dart';
import '../../../../../utils/dio_http.dart';
import '../../../../../utils/http_helper.dart';
import '../../../../colors/global.colors.dart';
import '../../../../widget/search_bar/index.dart';



String keyword = '';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
List<LandDetailData> data = [];



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            endDrawer: FilterDrawer(),
            appBar: AppBar(
              actions: [Container()],
              elevation: 0,
              title: SearchBar(
                dafaultInputValue: '',
                goBackcallback: () {},
                showMap: true,
                inputValue: '',
                onCancel: () {},
                onSearch: () {},
                onSearchSubmit: (String value) {
                 
                },
                showLoaction: true,
              ),
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              
            )));
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>true;

// Widget searchBar() {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
//     child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: GlobalColors.kPrimaryLightColor),
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//         padding: EdgeInsets.all(20),
//         height: 40,
//         child: Row(
//           //设置子widget居中对齐
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(
//               Icons.search,
//               color: Colors.grey,
//               size: 20,
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             //填充空间
//             Expanded(
//                 child: Text("搜你想要的",
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontSize: 14, color: Colors.black54))),
//             // Text(
//             //   "热搜",
//             //   style: TextStyle(color: Colors.blue, fontSize: 15),
//             // )
//           ],
//         )),
//   );
// }

}

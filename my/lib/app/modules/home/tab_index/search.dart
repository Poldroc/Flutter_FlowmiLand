

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/home/widget/searchPage/searchPage.dart';

import '../widget/search/land_search.dart';

class RootPageHead extends StatelessWidget {
  const RootPageHead({super.key});

  @override
  Widget build(BuildContext context) {
    return buildSearch(context);
  }
}

Widget buildSearch(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(child: _searchContent(context)),
        Icon(
          Icons.sort,
          size: 35,
        ),
      ],
    ),
  );
}
// return  GestureDetector(
//   onTap: (){
//   	//通过路由进行页面跳转
//       Get.to(SearchPage());
//   },
//   child: Container(

//   //添加圆角属性
//     decoration: BoxDecoration(
//         color: Colors.green[900],
//         borderRadius: BorderRadius.all(Radius.circular(10))),
//     padding: EdgeInsets.all(20),
//     height: 40,
//     child: Row(
//     //设置子widget居中对齐
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Icon(
//           Icons.search,
//           color: Colors.grey,
//           size: 20,
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         //填充空间
//         Expanded(
//             child: Text("搜你想要的",
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(fontSize: 14, color: Colors.black54))),
//         // Text(
//         //   "热搜",
//         //   style: TextStyle(color: Colors.blue, fontSize: 15),
//         // )
//       ],
//     ),
//   ),
// );

Widget _searchContent(BuildContext context) {
  return GestureDetector(
    onTap: () {
      //Get.to(/* SearchPage(), */
      showSearch(context: context, delegate: LandSearch());
      //);
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          /* boxShadow: [
        BoxShadow(color: GlobalColors.kPrimaryLightColor, offset: Offset(0.3, 0.5), blurRadius: 10)
      ], */
          color: GlobalColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(children: [
        Icon(
          Icons.search,
          size: 40,
        ),
        Expanded(child: Text('搜你想要'))
      ]),
    ),
  );
}

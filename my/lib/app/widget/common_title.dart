import 'package:flutter/material.dart';
import 'package:my/app/colors/global.colors.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  const CommonTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Text(title,style: TextStyle(color: GlobalColors.kPrimaryColor,fontSize: 20,
      fontWeight: FontWeight.w600
      ),),
    );
  }
}

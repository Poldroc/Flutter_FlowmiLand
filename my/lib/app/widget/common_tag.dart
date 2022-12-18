import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my/app/colors/global.colors.dart';

class CommonTag extends StatelessWidget {
  final String? title;
  //final Color color;
  final Color backgroundColor=GlobalColors.kPrimaryLightColor;
  
   CommonTag({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding:EdgeInsets.fromLTRB(4, 2, 4, 2),
      decoration: BoxDecoration(color: backgroundColor,
      borderRadius: BorderRadius.circular(5.0),
      ),
      child:  Text(title!,style: TextStyle(fontSize: 12,color: GlobalColors.kPrimaryColor),),
    );
  }
}

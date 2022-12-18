import 'package:flutter/material.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/widget/common_image.dart';

class UserRow extends StatelessWidget {
  final String userImage;
  final String userName;
  const UserRow({
    super.key,
    required this.userImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_UserName(), _UserImage()],
    );
  }

  Widget _UserImage() {
    return  ClipOval(
            child: CommonImage(
          src: userImage,
          fit: BoxFit.cover,
          height: 32,
          width: 32,
        
      ),
    );
  }

  Widget _UserName() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        
        height: 30,
        //width: 90,
        decoration: BoxDecoration(
            //color: GlobalColors.kPrimaryLightColor,
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(left: 6),
        child: Container(
          margin: EdgeInsets.only(left: 14,top: 4),
          child: Text(
            userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my/app/colors/global.colors.dart';

import '../controllers/add_controller.dart';

List<String> defautImages = [
  "https://img9.vilipix.com/picture/pages/regular/2022/08/31/12/101091270_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000",
  "https://img9.vilipix.com/picture/pages/regular/2022/08/31/12/101137838_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000",
  "https://img9.vilipix.com/picture/pages/regular/2022/08/31/12/101048953_p0_master1200.jpg?x-oss-process=image/resize,m_fill,w_1000"
];
double imageWidth = 750.0;
double imageHeight = 400.0;
double imageWidthHeightRatio = imageWidth / imageHeight;
var c = Get.put(AddController());

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<XFile?>> onChange;

  const CommonImagePicker({super.key, required this.onChange});

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
/* 
   final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery); 
    */

  _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality:50
      //maxWidth: (MediaQuery.of(context).size.width - 10 * 4) / 3,
      //maxHeight: ((MediaQuery.of(context).size.width - 10 * 4) / 3) /
      //imageWidthHeightRatio
    );
    if (image == null) return;
    setState(() {
      c.files = c.files..add(image);
      //c.files = XFile(image.path);
    });
    if (widget.onChange != null) {
      widget.onChange(c.files);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidthHeightRatio;

    Widget addButton = GestureDetector(
      onTap: (() {
        _pickImage();
      }),
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
            color: GlobalColors.kPrimaryLightColor,
            borderRadius: BorderRadius.circular(15)),
        width: width * 0.9,
        height: width * 0.9,
        child: Center(
            child: Icon(
          Icons.add_a_photo,
          size: 40,
          color: Colors.black54,
        )),
      ),
    );

    Widget wrapper(XFile imageUri) {
      return Stack(
        children: [
          Image.file(
            File(imageUri.path),
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
              right: -15,
              top: -13,
              child: IconButton(
                icon: Icon(Icons.delete_outline_rounded),
                onPressed: () {
                  setState(() {
                    c.files = c.files..remove(imageUri);
                  });
                  if (null != widget.onChange) {
                    widget.onChange(c.files);
                  }
                },
              ))
        ],
      );
    }

    List<Widget> list = c.files.map((item) => wrapper(item)).toList()
      ..add(addButton);

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: 
          Wrap(spacing: 10, runSpacing: 10, children: list),
        ),
        Text( 
          "(图片不少于2张)",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'focus_view.dart';

class HeroPage extends StatefulWidget {
  final Map arguments;
  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  List<String?> listData = [];
  late int currentPage;
  late int initialPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = widget.arguments["listData"];
    initialPage = widget.arguments["initialPage"];
    currentPage = initialPage+1 ;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                  child: /* PhotoView(imageProvider: NetworkImage(widget.arguments['imageUrl']),)//预览单张图片 */
                      PhotoViewGallery.builder(
                          itemCount: listData.length,
                          pageController:
                              PageController(initialPage: initialPage),
                          onPageChanged: ((index) {
                            setState(() {
                              currentPage = index ;
                            });
                          }),
                          builder: ((context, index) {
                            return PhotoViewGalleryPageOptions(
                                imageProvider: NetworkImage(listData[index]!));
                          })))),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "${currentPage}/${listData.length}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
              ))
        ],
      ),
    );
  }
}

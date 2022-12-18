import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:my/app/widget/common_image.dart';
import 'package:my/utils/config.dart';

class CommonSwiper extends StatelessWidget {
  final List images;
  const CommonSwiper({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.25,
        //width: size.width,
        child: Swiper(
          //autoplay: true,
          itemBuilder: ((context, index) {
            return CommonImage(
              src: Config.BaseUrl+images[index],
              fit: BoxFit.fill,
              height: size.height * 0.25,
              width: size.width,
            );
          }),
          itemCount: images.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }
}

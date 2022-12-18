import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  String src;
  double width;
  double height;
  BoxFit fit;

  CommonImage(
      {super.key,
      required this.src,
      required this.fit,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    
    return
        /* Container(width: width,
          //height: height,
      child: */
        CachedNetworkImage(
      width: width,
      imageUrl: src,
      /* imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ), */
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

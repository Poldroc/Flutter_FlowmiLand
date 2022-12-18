import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my/app/colors/global.colors.dart';

class Background extends StatefulWidget {
  final Widget child;
  const Background({super.key, required this.child});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
        //定义动画控制的变化范围
        lowerBound: -1.0,
        upperBound: 1.0,
        duration: Duration(milliseconds: 10000),
        value: 0.0,
        vsync: this);

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
          color: GlobalColors.kPrimaryColor,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              //裁剪

              AnimatedBuilder(
                animation: _animationController,
                child: buildContainer(context),
                builder: (BuildContext context, Widget? child) {
                  return ClipPath(
                    clipper: CustomHEaderClipPath(_animationController.value),
                    child: buildContainer(context),
                  );
                },
              ),

              this.widget.child
            ],
          )),
    );
  }

  Opacity buildContainer(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: GlobalColors.kPrimaryLightColor,
          )),
    );
  }
}

class CustomHEaderClipPath extends CustomClipper<Path> {
  //定义进度
  double progress;

  CustomHEaderClipPath(this.progress);
  //定义裁剪规则
  @override
  getClip(Size size) {
    //构建path
    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.8);

    //修改控制点
    double controllerCenterx =
        size.width * 0.5 + (size.width * 0.6 + 1) * sin(progress * pi);
    double controllerCentery = size.height * 0.8 + 70 * cos(progress * pi);
    //构建二阶曲线
    path.quadraticBezierTo(
        //控制点
        controllerCenterx,
        controllerCentery,
        //结束点
        size.width,
        size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  //是否刷新
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

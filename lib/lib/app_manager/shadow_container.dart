
import 'package:flutter/material.dart';

import 'constant/constant.dart';
class ShadowContainer extends StatelessWidget {

  final Widget? child;
  final Color? color;
  final Color? gradientColor;
  final EdgeInsets? padding;
  final DecorationImage? decorationImage;
  final double? height;
  final double? width;
  final BoxShape? shape;

  const ShadowContainer({Key? key, this.child,
  this.color,
  this.gradientColor,
  this.padding,
  this.decorationImage,
  this.height,
  this.width,
  this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: shape??BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.8,
              blurRadius: 0.8,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius:shape!=null? null: const BorderRadius.all(Radius.circular(Constant.globalRadius))
      ),
      child: Container(
          decoration:  BoxDecoration(
              shape: shape??BoxShape.rectangle,
              gradient: gradientColor==null?null:
              Constant.getGradient(gradientColor),
              image: decorationImage,
            color: color??Colors.white,
              borderRadius: shape!=null? null:const BorderRadius.all(Radius.circular(Constant.globalRadius))
          ),
          child: Padding(
            padding: padding??const EdgeInsets.all(8.0),
            child: child,
          )),
    );
  }
}
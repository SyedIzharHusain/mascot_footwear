

import 'package:flutter/material.dart';

import '../app_color.dart';
import '../shadow_container.dart';
import '../text_theme.dart';


class SelectionBox extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final IconData iconData;

  const SelectionBox({Key? key, required this.title, required this.description, required this.iconData, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      gradientColor: AppColor.white,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style:  MyTextTheme.mediumWCB.copyWith(color: AppColor.greyDark)),
            const SizedBox(height: 5,),
            Expanded(child:Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(iconData,
                color: AppColor.carouselBackground, size: 40,),
            )),
            // Image.asset(image,height: 50,),
            const SizedBox(height: 5,),
            Text(description.toString(),
                style:  MyTextTheme.smallWCB,),
          ],
        ),
      ),
    );
  }
}
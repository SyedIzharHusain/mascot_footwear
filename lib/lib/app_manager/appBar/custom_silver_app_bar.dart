

import 'package:flutter/material.dart';
import '../app_color.dart';
import '../text_theme.dart';
import '../widgets/buttons/back_button.dart';


class CustomSilverAppBar extends StatelessWidget {
  final String title;
  final Widget? background;
  final Widget? centerChild;
  final String? filePath;
  const CustomSilverAppBar({Key? key,

  required this.title,this.background,
    this.centerChild,
    this.filePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return        SliverAppBar(
      floating: false,
      expandedHeight: 200.0,
      leading:  PrimaryBackButton(
          color: AppColor.primaryColorLight
      ),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title:  Text(title,
          style: MyTextTheme.largePCB,),
        background:background?? Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image:  AssetImage(
                filePath?? 'assets/gym_wallpaper.png',

              ),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: centerChild??Container(
              color: Colors.black38,
            ),
          ),

        ),
      ),
    );
  }
}

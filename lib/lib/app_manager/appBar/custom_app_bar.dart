

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_color.dart';
import '../text_theme.dart';
import '../widgets/buttons/back_button.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool? centreTitle;
  const CustomAppBar({Key? key,

     this.title,
    this.actions, this.centreTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:  PrimaryBackButton(
        color: AppColor.black
      ),
      actions: actions,
      centerTitle: centreTitle??false,
      backgroundColor:   Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title:  Text(title??'',
          style: MyTextTheme.largeBCB,),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

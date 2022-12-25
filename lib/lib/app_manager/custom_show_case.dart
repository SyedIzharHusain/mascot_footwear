import 'package:flutter/material.dart';
import 'package:mascotfootwear/lib/app_manager/typography.dart';
import 'package:showcaseview/showcaseview.dart';

class CustomShowCase extends StatelessWidget {
final Widget child;
final String title;
  final String description;
  final GlobalKey globalKeys;


  const CustomShowCase({Key? key,required this.child,required this.title,required this.description,required this.globalKeys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Showcase(
      showArrow: true,
      key: globalKeys,
      title: title,
      description: description,
      titleTextStyle: black40016,
      child: child,
    );
  }
}

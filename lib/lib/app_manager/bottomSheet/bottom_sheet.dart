

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../app_color.dart';
import '../shadow_container.dart';

class CustomBottomSheet {


  static dynamic open(context,{
    Widget? child
  }) async{
    var data= await showBarModalBottomSheet (
      context: context,
      isDismissible: true,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: child??ShadowContainer(
            color: AppColor.primaryColorLight,
          ),
        ),
      ),
    );
    return data;
  }



}
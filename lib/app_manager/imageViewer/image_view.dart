


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../app_color.dart';
import '../constant/constant.dart';
import '../widgets/coloured_safe_area.dart';


class ImageView extends StatelessWidget {
  final String url;

  const ImageView({Key? key, required this.url}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Container(
        color: AppColor.white,
        child: Center(
          child:     CachedNetworkImage(

            imageUrl:url,
            imageBuilder: (context, imageProvider) =>   PhotoView(
              imageProvider: NetworkImage(url),
            ),
            placeholder: (context, url) => Constant.placeHolder,
            errorWidget: (context, url, error) =>  Constant.imageErrorIconWidget,
          ),
        ),
      ),
    );
  }
}

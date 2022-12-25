




import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';

import '../app_color.dart';
import '../constant/constant.dart';

class ProfileImage extends StatelessWidget {
  final String? url;

  const ProfileImage({super.key, required this.url});


  @override
  Widget build(BuildContext context) {

    print( "uuuuuuuuuuuuu "+url.toString());
    return
      (url==null || url=="")?
      Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.likeGrey,width: 2)
        ),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
              radius: 81,
              backgroundImage:
              AssetImage('assets/profile_demo.png')),
        ),
      ):(url.toString().contains("http")?
      CachedNetworkImage(
        imageUrl:  url.toString().replaceAll("\\","/"),
        imageBuilder: (context, imageProvider) =>
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      border: Border.all(color: AppColor.likeGrey,width: 2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 162,
                      width: 162,
                      decoration:   BoxDecoration(
                        shape: BoxShape.circle,
                          color: AppColor.themeColor,
                         // borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          image:  DecorationImage(image:
                          //NetworkImage('https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',), fit: BoxFit.cover)
                          NetworkImage(url.toString().replaceAll("\\","/")), fit: BoxFit.contain)
                      ),
                    ),
                  ),
                ),

              ],
            ),
        placeholder: (context, url) => Constant.placeHolder,
        errorWidget: (context, url, error) => Constant.imageErrorWidget,
      )
      // CircleAvatar(radius: 55,
      //       child: CachedNetworkImage(
      //   imageUrl:url.toString().replaceAll("\\","/"),
      //   imageBuilder: (context, imageProvider) =>
      //         PhotoView(
      //       imageProvider:imageProvider,
      //   ),
      //   placeholder: (context, url) => Constant.placeHolder,
      //   errorWidget: (context, url, error) =>  Constant.imageErrorIconWidget,
      // ),
      //     )
          :
      Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.likeGrey,width: 2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
              radius: 81,
              backgroundImage:
              FileImage(File(url.toString()))
          ),
        ),
      )
      );


  }
}




import 'dart:io' show Platform;


import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:new_version/new_version.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version/version.dart';

import '../app_color.dart';
import '../text_theme.dart';
import '../widgets/buttons/primary_button.dart';

Version latestVersion=Version(0, 0, 0);
Version currentVersion=Version(0, 0, 0);

class Updater{
  static const _appStoreUrl =
      'https://apps.apple.com/us/app/digi-doctor-his/id1601187611';
  static const _playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.his.android';




  static checkVersion(context) async{
    final newVersion = NewVersion(
    );

    try {
      VersionStatus? status = await newVersion.getVersionStatus();
      if(status!=null){
        currentVersion = Version.parse(status.localVersion.toString());
        // Version currentVersion = Version.parse('1.0.2');
        latestVersion = Version.parse(status.storeVersion.toString());
      }

      if(latestVersion > currentVersion){
        _showUpdateDialogue(latestVersion, context,
        showCancelButton: false);
      }

    }
    catch (e){
      // print(e);
      // var retry=await apiDialogue(context,'Alert', 'Internet connection issue, try to reconnect.',
      //     showCanCelButton: true
      // );
      // if(retry){
      //   var data= await  checkVersion(context);
      //   return data;
      // }
      // else{
      //   return cancelResponse;
      // }
    }



  }


  static _showUpdateDialogue(lat,context,{
    bool showCancelButton=false
  }){
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: (){
            return Future.value(false);
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: Lottie.asset('assets/update.json'),),
                        ),
                        Text('New version available',
                            style: MyTextTheme.mediumPCB),
                        Text('('+lat.toString()+')',
                            style: MyTextTheme.mediumPCB),
                        const SizedBox(height: 2,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Looks like you have an older version of the app.\n'
                              'Please update to get latest features and better experience.',
                              textAlign: TextAlign.center,
                              style: MyTextTheme.mediumBCN),
                        ),

                        Row(
                          children: [

                            showCancelButton? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,20,0),
                                child: PrimaryButton(
                                  color: AppColor.greyLight,
                                  title: 'Cancel', onPressed: () {
                                Navigator.pop(context);
                                },),
                              ),
                            ):Container(),
                            Expanded(
                              child: PrimaryButton(title: 'Update', onPressed: () {
                                if (Platform.isAndroid) {
                                  _launchURL(Uri.parse(_playStoreUrl));
                                } else if (Platform.isIOS) {
                                  _launchURL(Uri.parse(_appStoreUrl));
                                }
                              },),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  updateContainer(){
    return Visibility(
      visible: latestVersion > currentVersion,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,20,),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            // border: Border.all(color: AppColor().greyDark,
            // width: 1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text('version '+latestVersion.toString()+' is available',
                        style: MyTextTheme.mediumBCN,),
                    ),
                    const SizedBox(width: 15,),
                    PrimaryButton(
                      width: 120,
                      title: 'Update',
                      onPressed: (){
                        if (Platform.isAndroid) {
                          _launchURL(Uri.parse(_playStoreUrl));
                        } else if (Platform.isIOS) {
                          _launchURL(Uri.parse(_appStoreUrl));
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}


_launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}


import 'package:flutter/material.dart';

class CustomAlertDialogue{

  Color? color;
  Function? onPressOKButton;
  Function? onPressCancelButton;

  openAlertBox({@required context,headLine,headLineText,footLine,footTextStyle,footColor,color,headColor,onPressOkButton,onPressCancelButton,@required body,setState,isFooterVisible}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(18),
            content: SizedBox(
              // width: 300.0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: headColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: headLine ?? Text(
                          headLineText??'',
                          style: const TextStyle(color: Colors.white,fontSize:18,),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      child: body,
                    ),
                    Visibility(
                      visible: isFooterVisible ?? false,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        decoration: BoxDecoration(
                          color: footColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Text(
                            footLine??'',
                            style: footTextStyle,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
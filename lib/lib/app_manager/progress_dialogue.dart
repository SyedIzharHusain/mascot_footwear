import 'package:flutter/material.dart';
import 'text_theme.dart';
import 'package:lottie/lottie.dart';

late BuildContext currentContext;


class ProgressDialogue{
  

  static show(context, {
    required String message,
  }) async{

    // factsC.updateFactCount();
    // pressController.changeValue(true);
    _showProgressDialogue(context,message);
  }



  static bool hide() {
    try{
      Navigator.pop(currentContext);
      return true;
    }
    catch (e){
      return false;
    }
  }


}





_showProgressDialogue(context,message,) async{
  return    showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext dialogContext) {
      currentContext= dialogContext;
      return WillPopScope(
        onWillPop: (){
          ProgressDialogue.hide();
          return Future.value(false);
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.black54,
              child:     Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                                height: 150,
                                child: Lottie.asset('assets/progress_animation.json')),
                          ),
                          Text(message?? 'Please add a text',
                              textAlign: TextAlign.center,
                              style: MyTextTheme.mediumWCB),
                          // factsDialogue(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      );
    },
  );
}

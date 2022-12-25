


import 'package:flutter/material.dart';

import '../text_theme.dart';
import '../widgets/buttons/primary_button.dart';




class FunctionalSheet extends StatelessWidget {

  final String message;
  final String buttonName;
  final Function onPressButton;
  final bool showCancelButton;
  final TextAlign? textAlign;
  final Widget? child;

  const FunctionalSheet({Key? key,
    required this.message,
    required this.buttonName,
    required this.onPressButton,
    this.showCancelButton=true,
    this.textAlign,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,40,20,20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              child??Container(),
              child==null? Container():const SizedBox(height: 20,),
              Text(message.toString(),
                textAlign: textAlign??TextAlign.center,
                style: MyTextTheme.mediumBCB,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,20,20,20),
          child: Row(
            children: [

              showCancelButton? Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,20,0),
                  child: PrimaryButton(
                    borderColor: Colors.transparent,
                    elevation: 0.0,
                      color: Colors.black26,
                      onPressed: (){

                        Navigator.pop(context);
                      }, title: "CANCEL"),
                ),
              ):Container(),
              Expanded(
                child: PrimaryButton(
                    onPressed: (){

                  Navigator.pop(context);
                  onPressButton();
                }, title: buttonName.toUpperCase()),
              ),
            ],
          ),
        )
      ],
    );
  }
}

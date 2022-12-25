

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../text_theme.dart';
import '../widgets/buttons/primary_button.dart';
import 'api_response.dart';



class ManageResponse extends StatelessWidget {


  final ApiResponse response;
  final Widget child;
  final Function? onPressRetry;
  final bool showRetryOnEmptyData;
  final bool showChildOn;
  final bool showImage;


  const ManageResponse({Key? key, required this.response,
    required this.child,
    this.onPressRetry,
    this.showRetryOnEmptyData=true,
    this.showChildOn=false,
    this.showImage=true,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return getWidgetAccordingToResponse();
  }


  Widget getWidgetAccordingToResponse() {


    if(showChildOn){
      return child;
    }
    else {
      switch (response.status) {
        case Status.loading:
          return  Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(response.message.toString(),
                    style: MyTextTheme.mediumGCB,),
                ],
              ),
            ),
          );
        case Status.completed:
          return child;
        case Status.error:
          return _retryWidget() ;

        case Status.empty:
          return _retryWidget() ;
        case Status.initial:
        default:
          return  Container();
      }
    }

  }



  _retryWidget(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            response.message.toString().contains("SocketException")?

            Column(
              children: [
                showImage?SizedBox(
                    height: 100,
                    child: Lottie.asset('assets/no_internet_found.json')):Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Internet connection issue",style: MyTextTheme.mediumGCB,),
                )
              ],
            ) : response.status==Status.empty?

            Column(
              children: [
                showImage? SizedBox(
                    height: 100,
                    child: Lottie.asset('assets/no_data_found.json')):Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(response.message.toString(),style: MyTextTheme.mediumGCB,),
                ),
              ],
            )
                :Text(response.message.toString(),
              textAlign: TextAlign.center,
              style: MyTextTheme.mediumGCB,),
            (
                onPressRetry!=null  && (showRetryOnEmptyData || response.status!=Status.empty )
            )? Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                  width: 100,
                  padding: const EdgeInsets.all(0),
                  expanded: false,
                  onPressed: (){
                    onPressRetry!();
                  }, title: "RETRY"),
            ):Container()
          ],
        ),
      ),
    );
  }

}


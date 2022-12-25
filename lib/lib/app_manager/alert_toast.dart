



import 'package:fluttertoast/fluttertoast.dart';

class AlertToast {
  static void show(message){
    Fluttertoast.showToast(
      gravity: ToastGravity.TOP,
      msg: message,
      webPosition: 'right',
      webBgColor: "#603BE5",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
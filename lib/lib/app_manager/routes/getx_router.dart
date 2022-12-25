import 'package:get/get.dart';

class Go{

  static to(
  {
    screenName,
    String? routeName,
    Transition? transition,
    Duration? duration,
}
      ){
    Get.to(
      screenName,
      routeName: routeName,
      transition: transition ?? Transition.leftToRight,
      duration: duration ?? const Duration(seconds: 1)
    );
  }

  static replace(
      {
        screenName,
        String? routeName,
        Transition? transition,
        Duration? duration,
      }
      ){
    Get.off(
        screenName,
        routeName: routeName,
        transition: transition ?? Transition.leftToRight,
        duration: duration ?? const Duration(seconds: 1)
    );
  }

}
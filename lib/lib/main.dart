
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mascotfootwear/lib/view/homescreen.dart';
import 'app_manager/app_color.dart';
import 'app_manager/routes/getx_router.dart';
import 'app_manager/text_theme.dart';
import 'app_manager/user_dart.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetStorage.init('user');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
  }

  final UserData _userDataC = Get.put(UserData());

  @override
  Widget build(BuildContext context) {

    if (kDebugMode) {
      print(_userDataC.getUserToken);
      print('_userDataC.getUserToken');
    }
    return SimpleBuilder(
      builder: (_) {
        return GetMaterialApp(
          title: 'Mascot Footwear',
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: ()=>const Home()),
            GetPage(name: '/homeScreen', page: ()=>const HomeScreenView()),
          ],
        );
      },
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async
  {
    Timer(
        const Duration(seconds: 3),
            () =>
            pageRoute()
    );
  }

  pageRoute() async{
    //
    // final userData = UserData();


    // if(userData.getUserData.isNotEmpty && userData.getUserIsVerified)
    if(true)
    {
      Go.replace(
        screenName:  const HomeScreenView(),
        routeName: '/homeScreen',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
          child: Text('Mascot Footwear',style: MyTextTheme.customLargePCB,),
        ));
  }
}
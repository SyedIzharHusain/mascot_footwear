
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mascotfootwear/models/demo.dart';
import 'package:mascotfootwear/models/seModel.dart';
import '../../app_manager/alert_toast.dart';
import '../../app_manager/progress_dialogue.dart';
import '../../app_manager/user_dart.dart';



class HomeScreenController extends GetxController
{
  final UserData _userData=Get.put(UserData());
  final RxBool _showLogin = true.obs;
  final formKey = GlobalKey<FormState>().obs;
  RxInt  currentIndex = 0.obs;

  int get getCurrentIndex => currentIndex.value;

  set updateCurrentIndex(val){
    currentIndex.value=val;
    update();
  }

  final one = GlobalKey();
  final two = GlobalKey();
  final three = GlobalKey();
  final four = GlobalKey();

  late final PageController page;

  final formKeyChangePass = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> nameC = TextEditingController().obs;
  final Rx<TextEditingController> emailC = TextEditingController().obs;
  final Rx<TextEditingController> companyC = TextEditingController().obs;
  final Rx<TextEditingController> industryC = TextEditingController().obs;
  final Rx<TextEditingController> roleC = TextEditingController().obs;
  final Rx<TextEditingController> oldPC = TextEditingController().obs;
  final Rx<TextEditingController> newPC = TextEditingController().obs;


  bool get showLogin => _showLogin.value;

  set updateShowLogin(bool val){
    _showLogin.value = val;
    update();
  }


  List sEList=[].obs;
  List<SEModel> get getSEList=>List<SEModel>.from(
      sEList.map((element) => SEModel.fromJson(element))
  );
  set updateSEList(List val){
    sEList=val;
    update();
  }


  // getData (){
  //   var data = jsonDecode(UserData().demoData);
  //   print(data);
  //   print("decodedData");
  // }


  List demo=[].obs;
  List<Demo> get getDemo=>List<Demo>.from(
      demo.map((element) => Demo.fromJson(element))
  );
  set updateDemo(List val){
    demo=val;
    update();
  }



  //
  // initSocket() {
  //   socket = IO.io(ApiUtil.socketUrl,
  //       IO.OptionBuilder()// for Flutter or Dart VM
  //           .setAuth({'auth':{'userId': _userData.getUserId}}) // optional
  //           .build());
  //   print(_userData.getUserId);
  //
  //   // socket = IO.io(['ENDPOINT'], {
  //   //   'transports': ['websocket']
  //   // });
  //
  //   // socket.io.options['extraHeaders']=  {'auth':{'userId': _userData.getUserId.toString()}};
  //
  //
  //   socket.onConnect((data) => print('Connection estalished'));
  //   socket.onConnectError((data) => print('connection error : $data'));
  //   socket.onDisconnect((data) => print('socket io disconnected'));
  //
  //
  //   // socket.connect();
  //   //
  //   // print(socket.connect());
  //   // print('socket!.connect()');
  //
  //   // socket.onConnectError((error) {
  //   //   print(error);
  //   //   print('error');
  //   // }
  //   //
  //   // );
  //
  //   // if(socket.connected){
  //   //   print(socket.id);
  //   //   print('socket.id');
  //   // }
  //   // else{
  //   //   print('socket not connected');
  //   // }
  //
  // }
  //
  //
  // disposeSocket(){
  //   socket.close();
  // }
  //
  // getData()async{
  //   nameC.value.text = _userData.getUserName;
  //   emailC.value.text = _userData.getUserEmail;
  //   companyC.value.text = _userData.getUserCompany;
  //   industryC.value.text = _userData.getUserIndustry;
  //   roleC.value.text = _userData.getUserRole;
  //   update();
  // }
  //
  //
  // updateProfile(context){
  //   Map body={
  //     'email': emailC.value.text,
  //     'name': nameC.value.text,
  //     'companyName': companyC.value.text,
  //     'industryName': industryC.value.text,
  //     'role': roleC.value.text,
  //     '_id': _userData.getUserId,
  //   };
  //   HomePageRepository().updateProfile(context, 'api/v1/users/profile', ApiCallType.post(body: body));
  // }

  // connectSocket() async {
  //
  //
  //   HttpRequest.getString("https://dezyit-backend.herokuapp.com/api/v1/socket/sprint")
  //       .then((value) async {
  //     socket = IO.io(
  //         "https://dezyit-backend.herokuapp.com",
  //         IO.OptionBuilder()
  //             .setPath("/api/v1/socket/sprint")
  //             .setAuth({
  //           'secretToken':_userData.getUserToken
  //         })
  //             .setTransports(["websocket"]).setReconnectionAttempts(3).build());
  //
  //     socket.onConnect((data) {
  //       print('connected : ${socket.id}');
  //       print(data);
  //       // socket.on('connect', (_) => print('connect: ${socket.id}'));
  //       // socket.on('sprintCreate', handleSprintCreate(data));
  //
  //       // socket.on('typing', handleTyping);
  //       // socket.on('message', handleMessage);
  //       // socket.on('disconnect', (_) => print('disconnect'));
  //       // socket.on('fromServer', (_) => print(_));
  //     });
  //     socket.onConnectError((data) => print("Error"));
  //
  //     socket.on('sprintInvitation', (data){
  //       handleSprintInvite(data);
  //     });
  //     socket.on('sprintNewSprintAdded', (data){
  //       print('object');
  //       print(data);
  //     });
  //     socket.on('errorInfo', (data){
  //       print(data);
  //     });
  //     socket.onDisconnect((data){
  //       print("disconnected");
  //       socket.close();
  //     });
  //     socket.on("change", (data) => print(data));
  //   });
  // }


  handleSprintInvite(Map<String, dynamic> data) async {
    print(data);
  }

  //
  // sendSprintCreate() {
  //
  //   print('sprint created');
  //
  //   socket.emit("sprintCreate",
  //       {
  //         "sprintName": "test",
  //         "sprintMaster": _userData.getUserEmail,
  //         "sprintDuration": "1",
  //         "members": [
  //           {
  //             "email": "demo@email.com",
  //             "access": "VIEW",
  //             "isSprintOwner": true
  //           }
  //         ]
  //       }
  //   );
  // }

  // socket.onevent(packet)


  // Map body={
  //
  // };
  // HomePageRepository().socketApi(context, 'api/v1/socket/sprint', ApiCallType.post(body: body));

  // updatePassword(context){
  //   Map body={
  //     "_id": _userData.getUserId,
  //     "currentPassword": oldPC.value.text,
  //     "newPassword": newPC.value.text
  //     // '_id': _userData.getU,
  //   };
  //   HomePageRepository().updatePassword(context, 'api/v1/users/change-password', ApiCallType.post(body: body));
  // }

  logout(context)async{
    ProgressDialogue.show(context, message: 'Logging out !');
    await _userData.removeUserData();
    Get.offAllNamed('/login');
    ProgressDialogue.hide();
    AlertToast.show('Logged out successfully');
  }

}
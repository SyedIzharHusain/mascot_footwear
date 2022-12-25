

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../alert_toast.dart';
import '../local_storage/local_storage.dart';
import 'api_util.dart';
import 'error_alert.dart';








enum ApiType{
  get,
  post,
  rawPost,
}

class ApiCallType {
  Map? body;
  ApiType apiType;

  ApiCallType.get() : apiType = ApiType.get;
  ApiCallType.post({
    required this.body
  }) : apiType = ApiType.post
  ;
  ApiCallType.rawPost({
    required this.body
  }) : apiType = ApiType.rawPost;

}



class Api {


  final LocalStorage _localStorage=LocalStorage();


  Future<dynamic> call(context, {
    required String url,
    required ApiCallType apiCallType,
    bool showRetryEvent = false,
    bool token = false,
    String? storeKey,
    String? newBaseUrl,
    bool localStorage=false,
    ValueChanged? onFoundStoredData
  }) async {
    String myUrl = (newBaseUrl ?? ApiUtil.baseUrl) + url;
    String userId = "";
    Map body = apiCallType.body??{};
    Map<String,String>? header = token?{
      'accessToken': await _localStorage.fetchData(key: 'token'),
      'userID': userId.toString(),
    }:null;
    if(apiCallType.apiType==ApiType.rawPost){
      header=header??{};
      header.addAll({
        'Content-Type': 'application/json'
      });
    }


    if(onFoundStoredData!=null){
      var storedData=(await _localStorage.fetchData(key: storeKey??url));
      if(storedData!=null){
        onFoundStoredData(storedData);
      }

    }

    http.Response? response;
    http.StreamedResponse? streamResponse;
    if (kDebugMode) {
      log("Api call at ${DateTime.now()}");
      log("Type: ${apiCallType.apiType.name.toString()}");
      if(header!=null){
        log("Header: $header");
      }
      log("URL: $myUrl");
      log("BODY: $body");
    }




    try {
      switch (apiCallType.apiType) {
        case ApiType.post:
          response = await http.post(
              Uri.parse(myUrl),
              body: body,
              headers: header
          );
          break;

        case ApiType.get:
          response = await http.get(
              Uri.parse(myUrl),
              headers: header
          );
          break;

        case ApiType.rawPost:


          var request = http.Request('POST', Uri.parse(myUrl));
          request.body = json.encode(body);
          request.headers.addAll(header??{
            'Content-Type': 'application/json'
          });
          streamResponse = await request.send();


          break;
        default:
          break;
      }

      log(response.toString());


      if (response != null) {
        var data = await _handleDecodeAndStorage(
          url: url,
          storeKey: storeKey,
          localStorage: localStorage,
          encodeData: response.body,
        );
        return data;
      }
      else if (streamResponse != null) {
        var res = await streamResponse.stream.bytesToString();
        var data = await _handleDecodeAndStorage(
          url: url,
          storeKey: storeKey,
          localStorage: localStorage,
          encodeData: res,

        );
        return data;
      }
      else {
        AlertToast.show("Null response");
        var storedData=(await _localStorage.fetchData(key: storeKey??url));
        var errorRes=storedData??ApiUtil.cancelResponse;
        return errorRes;
      }
    }
    catch (e) {
      if (kDebugMode) {
        print(e.toString());
        print('e.toString()');
      }

      if (showRetryEvent) {
        var retry = await errorAlert(context, 'Alert', e.toString(),
        );
        if (retry) {
          var data = await call(context,
              url: url,
              apiCallType: apiCallType,
              showRetryEvent: showRetryEvent,
              token: token,
              newBaseUrl: newBaseUrl,
              localStorage: localStorage
          );
          return data;
        }
        else {
          var storedData=(await _localStorage.fetchData(key: storeKey??url));
          var errorRes=storedData??ApiUtil.cancelResponse;
          return errorRes;
        }
      }
      else {
        var storedData=(await _localStorage.fetchData(key: storeKey??url));
        var errorRes=storedData??ApiUtil.cancelResponse;
        return errorRes;
      }
    }
  }




  Future<Map> _handleDecodeAndStorage({

    required String url,
    required String? storeKey,
    required var encodeData,
    required bool localStorage,
  }) async{
    if (kDebugMode) {
      log("Response: $encodeData\n");
    }
    try{
      var decodeData=(await json.decode(encodeData));
      if(localStorage){
        _localStorage.storeData(key: url, data: decodeData);
      }
      return decodeData;
    }
    catch(e){

      log(e.toString());

      var storedData=(await _localStorage.fetchData(key: url));
      var errorRes=storedData??ApiUtil.cancelResponse;
      return errorRes;
    }

  }


}
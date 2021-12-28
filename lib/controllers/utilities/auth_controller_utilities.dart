import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:netcoin_v_1/controllers/authintcation_controller.dart';
import 'package:netcoin_v_1/data/settings/app_settengs.dart';
import 'package:netcoin_v_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtilities {
  static Future<String> encrypt(
      String stringToEncrypt, String actionName) async {
    String result = 'empty';

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      result = await MyApp.platform.invokeMethod('Encrypt', {
        "massage": stringToEncrypt,
        "key": actionName == 'signUp'
            ? hexDefualtKey
            : pref.getString('userEncryptKey'),
        "iv": hexDefualtKey,
        "method": actionName == 'signUp' ? 'signUp' : 'logIn',
      });
      print(result);
    } on PlatformException catch (e) {
      throw "Failed to Encrypt: '${e.message}'.";
    }

    return result;
  }

  static Future<String?> decrypt(
      String stringToDecrypt, String actionName) async {
    String result = 'empty';
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('-----------------SharedPreferences dec--------------');
    print(pref.getString('userEncryptKey'));

    try {
      result = await MyApp.platform.invokeMethod('Decrypt', {
        "massage": stringToDecrypt,
        "iv": hexDefualtKey,
        "key": actionName == 'signUp'
            ? hexDefualtKey
            : pref.getString('userEncryptKey')!,
        "method": actionName == 'signUp' ? 'signUp' : 'logIn',
      });
    } on PlatformException catch (e) {
      throw "Failed to Decrypt: '${e.message}'.";
    }

    return result;
  }

  static Future<String?>? getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.device; // unique ID on Android
    }
  }

  static Future<String> buildRegistrationEnvlop(
      String? userID, String? password) async {
    return '''<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
  <soapenv:Header/>
  <soapenv:Body>
  <tem:SignUp2>
  <tem:UserID>$userID</tem:UserID>
  <tem:UserToken>${await encrypt("$password#0#$appVersion#${await getDeviceInfo()}#$companyID#$appVersion#${AuthenticationController.onsignalID}", "signUp")}</tem:UserToken>
  </tem:SignUp2>
  </soapenv:Body>
  </soapenv:Envelope>
  ''';
  }

  static Future<String> buildLoginEnvlop(
      String? userID, String? password) async {
    print('-----------------user token dec--------------');
    print(await decrypt(
        await encrypt(
            "${password}#0#LogIn2#${await getDeviceInfo()}#${companyID}#${appVersion}#${AuthenticationController.onsignalID}",
            "logIn"),
        "logIn"));
    print('-----------------opration token dec--------------');
    print(await decrypt(
        await encrypt(
            "1#$appVersion#${AuthenticationController.onsignalID}", 'logIn'),
        'logIn'));

    return '''<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
  <soapenv:Header/>
  <soapenv:Body>
  <tem:DoOperation>
  <tem:UserID>$userID</tem:UserID>
  <tem:UserToken>
  ${await encrypt("${password}#0#LogIn2#${await getDeviceInfo()}#${companyID}#${appVersion}#${AuthenticationController.onsignalID}", "logIn")}</tem:UserToken>
  <tem:OperationToken>${await encrypt("1#$appVersion#${AuthenticationController.onsignalID}", "logIn")}</tem:OperationToken> 
  </tem:DoOperation>
  </soapenv:Body>
  </soapenv:Envelope>
  ''';
  }

  static Map<String, String> buildRegistrationHeader(String actionName) => {
        'Content-Type': "text/xml;charset=utf-8",
        'SOAPAction': "http://tempuri.org/IService/$actionName",
        "Host": host
      };

  static Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }

  static String convertUint8ListToString(Uint8List uint8list) {
    return String.fromCharCodes(uint8list);
  }
}

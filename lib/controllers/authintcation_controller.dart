import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netcoin_v_1/controllers/utilities/auth_controller_utilities.dart';
import 'package:netcoin_v_1/data/models/user_model.dart';
import 'package:netcoin_v_1/data/settings/app_settengs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

class AuthenticationController extends GetxController {
  static String? onsignalID;
  String? _userID;
  UserModel? userInfo;
  String? _userEncryptKey;
  String? _savedPassword;
  String? _expairedPassword;
  String? _userName;
  String? _userParentName;
  String? _userParentMobile;
  String? _userOID;
  String? _userSMSNum;
  String? _userBalance;

  String? _userType;
  bool _isPasswordSaved = false;
  bool isDirectLogin = false;

//getters
  String? get userID {
    return _userID;
  }

  String? get userParentName {
    return _userParentName;
  }

  String? get userParentMobile {
    return _userParentMobile;
  }

  String? get userOID {
    return _userOID;
  }

  String? get userSMSNum {
    return _userSMSNum;
  }

  String? get userEncryptKey {
    return _userEncryptKey;
  }

  String? get userBalance {
    return _userBalance;
  }

  String? get userType {
    return _userType;
  }

  String? get expairedPassword {
    return _expairedPassword;
  }

  String? get userName {
    return _userName;
  }

  String? get savdePassword {
    return _savedPassword;
  }

  bool get isPasswordSaved {
    return savdePassword != null;
  }

  Future<void> logIn(UserModel user) async {
    print('-------------logIn------------------------');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String registrationEnvelope =
        await AuthUtilities.buildLoginEnvlop(user.userCode, user.password);
    Map<String, String> registrationHeaders =
        AuthUtilities.buildRegistrationHeader('DoOperation');
    print('-------------Envlop------------------------');
    print(registrationEnvelope);
    try {
      print(
          '_______________________________try____________________________________');
      http.Response response = await http.post(Uri.parse(endPoint),
          headers: registrationHeaders, body: registrationEnvelope);
      XmlDocument dec = XmlDocument.parse(response.body);
      print(
          '____________________________response_______________________________________');
      print(dec.rootElement.text);
      print(
          '___________________________________________________________________');
      if (dec.rootElement.text.contains('#')) {
        throw dec.rootElement.text;
      } else {
        AuthUtilities.decrypt(dec.rootElement.text, 'logIn').then((result) {
          List<String>? response = result?.split('#');
          print(
              '____________________________login result_______________________________________');
          print(result);
          //OK#0#00.00#0#2#هيتم الشعراني
          _userName = response![5];
          _userType = response[4];
          _userBalance = response[2];
          _expairedPassword = response[3];
          pref.setString('userBalance', response[2]);
        });

        // _userID = pref.getString('userID');
        /*_savedPassword = user.password!;
        _userID = pref.getString('userID');
        _savedPassword != pref.getString('password');
        _userParentName = pref.getString('userParentName');
        _userParentMobile = pref.getString('userParentMobile');
        _userOID = pref.getString('userOID');
        _userSMSNum = pref.getString('userSMSNum');
        AuthUtilities.decrypt(pref.getString('userEncryptKey')!, 'signUp')
            .then((value) => _userEncryptKey = value);*/
      }

      update();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signUp(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String registrationEnvelope = await AuthUtilities.buildRegistrationEnvlop(
        user.userCode, user.password);
    print('-------------Envlop------------------------');
    print(registrationEnvelope);
    Map<String, String> registrationHeaders =
        AuthUtilities.buildRegistrationHeader('SignUp2');
    try {
      http.Response response = await http.post(Uri.parse(endPoint),
          headers: registrationHeaders, body: registrationEnvelope);
      XmlDocument dec = XmlDocument.parse(response.body);
      print('--------------res--------------');
      print(dec.rootElement.text);
      print(await AuthUtilities.decrypt(dec.rootElement.text, 'signUp'));
      if (dec.rootElement.text.contains('#')) {
        throw dec.rootElement.text;
      } else {
        AuthUtilities.decrypt(dec.rootElement.text, 'signUp')
            .then((result) async {
          List<String>? response = result?.split('#');
          print('--------------reresults--------------');
          print(result);
          pref.setString('userID', user.userCode!);
          userInfo = UserModel(
              userCode: _userID,
              userEncrypt: response![1],
              userParentName: response[2],
              userParentMobile: response[3],
              userOID: response[4],
              userSMSNum: response[5]);
          _userID = userInfo!.userCode;

          _userEncryptKey = response[1];
          pref.setString('userEncryptKey', _userEncryptKey!);
          logIn(UserModel(userCode: 'h77', password: '772967092'));
          _savedPassword = user.password!;
          pref.setString('userID', user!.userCode!);
          pref.setString('password', _savedPassword!);
          pref.setString('userParentName', userInfo!.userParentName!);
          pref.setString('userParentMobile', userInfo!.userParentMobile!);
          pref.setString('userOID', userInfo!.userOID!);
          pref.setString('userSMSNum', userInfo!.userSMSNum!);
        });
      }

      update();
    } catch (e) {
      throw e;
    }
  }

  /*Future<void> requestToOpenNewAccount(UserModel UserInfo) async {
    const url = '$endPoint/registration';
    var openAccountEnvelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <RequestToOpenAccount xmlns="http://foo.com/barr/320/Default">
    <UserCode>${UserInfo.userCode}</UserCode>
      <Password>${UserInfo.password}</Password> 
      <ConfirmPassword>${UserInfo.confirmPassword}</ConfirmPassword>
      <UserFullName>${UserInfo.userFullName}</UserFullName> 
      <UserNickName>${UserInfo.userNickName}</UserNickName> 
       <UserEmail>${UserInfo.userEmail}</UserEmail> 
      <MobileNum>${UserInfo.mobileNum}</MobileNum> 
      <PhoneNum>${UserInfo.phoneNum}</PhoneNum> 
      <JobType>${UserInfo.jobType}</JobType> 
      <MarketAddress>${UserInfo.marketAddress}</MarketAddress> 
      <City>${UserInfo.city}</City> 
      <SmallTown>${UserInfo.smallTown}</SmallTown> 
      <IdCardType>${UserInfo.idCardType}</IdCardType> 
      <IdCardNumber>${UserInfo.idCardNumber}</IdCardNumber>
      <IdCardIssuance>${UserInfo.idCardIssuance}</IdCardIssuance>
      <IdCardDate>${UserInfo.idCardDate}</IdCardDate>
      <IdCardForewordImage>${UserInfo.idCardForwordImage}</IdCardForewordImage>
      <IdCardBackwardImage>${UserInfo.idCardBackwordImage}</IdCardBackwardImage>
    </RequestToOpenAccount>
  </soap:Body>
</soap:Envelope>
''';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'text/xml; '
                'charset=utf-8',
            'SOAPAction': 'RequestToOpenAccount',
            "Host": endPoint
          },
          body: openAccountEnvelope);
      String resData = response.body;
      update();
    } catch (error) {
      throw error;
    }
  }*/

  Future<bool> tryAutoLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (!(pref.containsKey('userID') && pref.containsKey('password'))) {
      return false;
    }
    _userID = pref.getString('userID');
    _savedPassword = pref.getString('password');
    update();
    return true;
  }

  logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    update();
  }

  changeSavePasswordState() {
    _isPasswordSaved = !_isPasswordSaved;
    update();
  }

  changeIsDirectLoginState() {
    isDirectLogin = !isDirectLogin;
    update();
  }

  savePassword(String pass) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _savedPassword = pass;
    pref.setString('SavedPassword', pass);
    update();
  }

  unSavePassword() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey('SavedPassword')) {
      pref.remove('SavedPassword');
    }
    update();
  }

  getFromShared() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _userID = pref.getString('userID');
    _userBalance = pref.getString('userBalance');
  }
}

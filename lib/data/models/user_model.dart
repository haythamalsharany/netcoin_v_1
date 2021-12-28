class UserModel {
  String? userCode;
  String? userName;
  String? userType;
  String? userEncrypt;
  String? password;
  String? userExpairedPass;
  String? userBalance;
  String? userParentName;
  String? userParentMobile;
  String? userOID;
  String? userSMSNum;

  UserModel({
    this.userCode,
    this.userName,
    this.userType,
    this.password,
    this.userExpairedPass,
    this.userBalance,
    this.userParentName,
    this.userParentMobile,
    this.userSMSNum,
    this.userOID,
    this.userEncrypt,
  });
}

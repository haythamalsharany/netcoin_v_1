// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:netcoin_v_1/controllers/authintcation_controller.dart';
import 'package:netcoin_v_1/data/models/user_model.dart';
import 'package:netcoin_v_1/views/constants/app_colors.dart';
import 'package:netcoin_v_1/views/constants/app_strings.dart';
import 'package:netcoin_v_1/views/screens/authintcation_screens/new_account_screen/new_account_screen.dart';
import 'package:netcoin_v_1/views/screens/home_screen/home_screen.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text_button.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final bool checkedValue = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
    'userName': '',
    'password': '',
  };

  LoginScreen({Key? key}) : super(key: key);

  void _showErrorDialog(String message, BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
              title: const Text('حصل خطأ ما '),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('موافق'))
              ],
            ));
  }

  Future<void> _submit(BuildContext ctx) async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    FocusScope.of(ctx).unfocus();
    _formKey.currentState!.save();

    try {
      AuthenticationController auth = Get.find();
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.containsKey('userEncryptKey') &&
          pref.getString('userEncryptKey') != null) {
        await auth.logIn(UserModel(
            userCode: _authData['userName'], password: _authData['password']));
      } else {
        print('-------------signUp------------------------');
        auth.signUp(UserModel(
            userCode: _authData['userName'], password: _authData['password']));
      }
      Get.off(() => HomeScreen());
    } catch (e) {
      const errorMessage = 'Could not authintcate you , Please try again';

      _showErrorDialog(e.toString(), ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: AppColors.lightOrange),
                  child: Image.asset(
                    'assets/images/netCoin.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 0.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(200.r),
                          bottomRight: Radius.circular(200.r))),
                  child: CustomText(
                    onTap: () {},
                    text: AppStrings.headTxt,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.puretWight,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.userCodeHintTxt,
                        icon: Icon(Icons.code),
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return ' ادخل اسم مستخدم';
                          }
                          if (value.length > 7) {
                            return ' اسم المستخدم طويل جدا';
                          }
                          return null;
                        },
                        onSaved: (String? newValue) {
                          _authData['userName'] = newValue!;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.passwordHintTxt,
                        icon: Icon(Icons.lock),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'كلمة المرور قصيرة  !';
                          }
                          return null;
                        },
                        onSaved: (String? newValue) {
                          _authData['password'] = newValue!;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w),
                  child: Row(
                    children: [
                      CustomText(
                        onTap: () {
                          Get.to(ForgetPasswordScreen());
                        },
                        text: AppStrings.forgetPassword,
                        fontSize: 12.sp,
                        color: AppColors.lightBlue,
                        alignment: Alignment.topRight,
                      ),
                      Spacer(),
                      Checkbox(
                          activeColor: AppColors.orange,
                          value: checkedValue,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppColors.lightBlue, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: (value) {}),
                      CustomText(
                        onTap: () {},
                        text: AppStrings.savePassword,
                        fontSize: 12.sp,
                        color: AppColors.lightBlue,
                        //alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextButton(
                    onParessed: () {
                      _submit(context);
                      //Get.off(HomeScreen());
                    },
                    backgroundButtonColor: AppColors.lightBlue,
                    text: AppStrings.loginTxtButton,
                    color: AppColors.puretWight),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(
                      width: 14.w,
                    ),
                    CustomText(
                      onTap: () {},
                      text: AppStrings.orTxt,
                      fontSize: 14.sp,
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextButton(
                    onParessed: () {
                      Get.to(NewAccountScreen());
                    },
                    backgroundButtonColor: AppColors.orange,
                    text: AppStrings.createAccountButton,
                    color: AppColors.puretWight)
              ],
            ),
          ),
        );
      },
    );
    /*ScreenUtilInit(builder: () {
      return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'اسم المستخدم'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return ' ادخل اسم مستخدم';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['userName'] = value!;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'كلمة المرور '),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'كلمة المرور قصيرة  !';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['password'] = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text('SIGN UP'),
                    onPressed: () => _submit(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8.0),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryTextTheme.button!.color,
                  ),
                ]),
              ),
            )),
      );
    });*/
  }
}

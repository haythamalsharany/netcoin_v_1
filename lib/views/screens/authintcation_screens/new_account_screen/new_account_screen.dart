// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:netcoin_v_1/views/constants/app_colors.dart';
import 'package:netcoin_v_1/views/constants/app_strings.dart';
import 'package:netcoin_v_1/views/screens/authintcation_screens/open_new_account_screen/open_new_account_screen.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text_button.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text_field.dart';

import '../../forget_password_screen.dart';

class NewAccountScreen extends StatelessWidget {
  final bool checkedValue = false;

  const NewAccountScreen({Key? key}) : super(key: key);

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
                    'images/netCoin.png',
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
                  child: Column(
                    children: [
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.userCodeHintTxt,
                        icon: Icon(Icons.code),
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.passwordHintTxt,
                        icon: Icon(Icons.lock),
                        obscureText: true,
                        validator: (value) {},
                        onSaved: (String? newValue) {},
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
                    onParessed: () {},
                    backgroundButtonColor: AppColors.lightBlue,
                    text: AppStrings.authButton,
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
                      Get.to(OpenNewAccountScreen());
                    },
                    backgroundButtonColor: AppColors.orange,
                    text: AppStrings.openNewAccountButton,
                    color: AppColors.puretWight)
              ],
            ),
          ),
        );
      },
    );
  }
}

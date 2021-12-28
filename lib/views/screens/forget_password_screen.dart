// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netcoin_v_1/views/constants/app_strings.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../shared_componants/custom_text_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      return Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text(AppStrings.restoreAccount),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200.r),
                  bottomRight: Radius.circular(200.r))),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.h),
            child: SizedBox(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Image.asset('images/info.png'),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: CustomTextButton(
                    onParessed: () {},
                    backgroundButtonColor: AppColors.lightBlue,
                    text: AppStrings.ContactServiceProvider,
                    color: AppColors.puretWight),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: CustomTextButton(
                    onParessed: () {},
                    backgroundButtonColor: AppColors.orange,
                    text: AppStrings.contactAgent,
                    color: AppColors.puretWight),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      );
    });
  }
}

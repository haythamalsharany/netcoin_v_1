// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netcoin_v_1/views/constants/app_colors.dart';
import 'package:netcoin_v_1/views/constants/app_strings.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text_field.dart';

class OpenNewAccountScreen extends StatelessWidget {
  const OpenNewAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return Scaffold(
            appBar: AppBar(
              elevation: 15,
              title: Text(AppStrings.openNewAccountButton),
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
            body: Padding(
              padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        autoFoucs: true,
                        textInputType: TextInputType.number,
                        hintText: AppStrings.userCodeHintTxt,
                        icon: Icon(Icons.code),
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.passwordHintTxt,
                        icon: Icon(Icons.lock_outline),
                        obscureText: true,
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.confirmPasswordHintTxt,
                        icon: Icon(Icons.lock),
                        obscureText: true,
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.fullNameHintTxt,
                        icon: Icon(Icons.person),
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.commercialNameHintTxt,
                        icon: Icon(Icons.badge),
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        onSaved: (String? newValue) {},
                        textInputType: TextInputType.number,
                        hintText: AppStrings.phoneNumberHintTxt,
                        icon: Icon(Icons.phone_android),
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.number,
                        hintText: AppStrings.teleNumberHintTxt,
                        icon: Icon(Icons.phone),
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.emailAddress,
                        onSaved: (String? newValue) {},
                        hintText: AppStrings.emailHintTxt,
                        icon: Icon(Icons.email),
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        hintText: AppStrings.jopHintTxt,
                        textInputType: TextInputType.text,
                        icon: Icon(Icons.badge),
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.storeAddressHintTxt,
                        icon: Icon(Icons.store),
                        validator: (value) {},
                        onSaved: (String? newValue) {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        onTap: () {},
                        text: AppStrings.idCardInformation,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightBlue,
                        alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColors.lightBlue)),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              textInputType: TextInputType.text,
                              hintText: AppStrings.cardKind,
                              icon: Icon(Icons.credit_card_outlined),
                              validator: (value) {},
                              onSaved: (String? newValue) {},
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                              textInputType: TextInputType.number,
                              hintText: AppStrings.idCardNumber,
                              icon: Icon(Icons.credit_card),
                              validator: (value) {},
                              onSaved: (String? newValue) {},
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CustomTextFormField(
                                    textInputType: TextInputType.text,
                                    hintText: AppStrings.cardIssuer,
                                    icon: Icon(Icons.place),
                                    validator: (value) {},
                                    onSaved: (String? newValue) {},
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CustomTextFormField(
                                    textInputType: TextInputType.datetime,
                                    hintText: AppStrings.cardIssuerDate,
                                    icon: Icon(Icons.date_range),
                                    validator: (value) {},
                                    onSaved: (String? newValue) {},
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

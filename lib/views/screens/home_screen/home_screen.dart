// ignore_for_file: prefer_const_constructors  , prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:netcoin_v_1/controllers/authintcation_controller.dart';
import 'package:netcoin_v_1/views/constants/app_colors.dart';
import 'package:netcoin_v_1/views/constants/app_strings.dart';
import 'package:netcoin_v_1/views/screens/authintcation_screens/open_new_account_screen/open_new_account_screen.dart';
import 'package:netcoin_v_1/views/screens/exchange_screen/exchange_screen.dart';
import 'package:netcoin_v_1/views/screens/games_screen/games_screen.dart';
import 'package:netcoin_v_1/views/screens/pay_screen/pay_screen.dart';
import 'package:netcoin_v_1/views/shared_componants/custom_text.dart';

import 'custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      AuthenticationController auth = Get.find();
      return Scaffold(
          appBar: AppBar(
            elevation: 100,
            backgroundColor: AppColors.primaryColor,
            title: Text(AppStrings.netCoin),
            centerTitle: true,
            leading: Icon(Icons.menu),
            actions: [
              Icon(Icons.update),
              SizedBox(
                width: 5.w,
              ),
              Icon(Icons.notifications)
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r))),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.h),
              child: Column(
                children: [
                  GetBuilder<AuthenticationController>(
                    builder: (_) => CustomText(
                      text: '${AppStrings.fundsTxt} ${auth.userBalance!}',
                      fontSize: 14.sp,
                      color: AppColors.puretWight,
                      fontWeight: FontWeight.w500,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
            bottomOpacity: 0.6,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                    child: Image.asset('assets/images/netCoin.png')),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      image: 'assets/images/pay.png',
                      onTap: () {
                        Get.to(PayScreen());
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomCard(
                      image: 'assets/images/games.png',
                      onTap: () {
                        Get.to(GamesScreen());
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomCard(
                      image: 'assets/images/exchange.png',
                      onTap: () {
                        Get.to(ExchangeScreen());
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      image: 'images/phone.png',
                      onTap: () {
                        Get.to(OpenNewAccountScreen());
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomCard(
                      image: 'assets/images/ryal.png',
                      onTap: () {
                        Get.to(OpenNewAccountScreen());
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomCard(
                        image: 'assets/images/other.png',
                        onTap: () {
                          Get.to(OpenNewAccountScreen());
                        }),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ));
    });
  }
}

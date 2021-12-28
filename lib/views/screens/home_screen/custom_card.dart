import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netcoin_v_1/views/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final Function onTap;

  const CustomCard({Key? key, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          child: GestureDetector(
            onTap: () {
              onTap();
            },
            child: Card(
              shadowColor: AppColors.primaryColor,
              clipBehavior: Clip.antiAlias,
              elevation: 15,
              color: AppColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, right: 20, left: 20, top: 0),
                  child: Image.asset(image)),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

class HomeAppBarBody extends StatelessWidget {
  const HomeAppBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 70.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5.h,
            children: [
              Text(
                'Hello,',
                style: AppStyles.textStyle14Regular.copyWith(
                  fontSize: 20.sp,
                  color: kSecondryColor,
                ),
              ),
              Text(
                'Ahmed Omar',
                style: AppStyles.textStyle20SemiBold.copyWith(
                  fontSize: 30.sp,
                  color: kSecondryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

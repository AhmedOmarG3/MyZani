import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_styles.dart';

class TransactionHeaderColumn extends StatelessWidget {
  const TransactionHeaderColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            shape: BoxShape.circle,
          ),
          child: Image.asset(AppImages.imagesYoutube),
        ),
        SizedBox(height: 10.h),
        Container(
          width: 120.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: Color(0xff438883).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(
              'income',
              style: AppStyles.textStyle15Medium.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff438883),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          '\$ 850.00',
          style: AppStyles.textStyle20SemiBold.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Color(0XFF000000),
          ),
        ),
      ],
    );
  }
}

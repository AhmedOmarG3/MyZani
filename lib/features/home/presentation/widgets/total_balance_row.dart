import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

class TotalBalanceRow extends StatelessWidget {
  const TotalBalanceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Text(
              'Total Balance',
              style: AppStyles.textStyle15Medium.copyWith(
                color: kSecondryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: kSecondryColor,
                  size: 15.sp,
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Transform.rotate(
            angle: math.pi / 2,
            child: Icon(
              Icons.more_vert,
              size: 25.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

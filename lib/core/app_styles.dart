import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/colors.dart';

class AppStyles {
  static TextStyle textStyle36Bold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w900,
    color: kPrimaryColor,
  );
  static TextStyle textStyle18SemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: kSecondryColor,
  );
  static TextStyle textStyle14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle textStyle15Medium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: kGreyColor,
  );
  static TextStyle textStyle20SemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle textStyle36BoldWithShadow = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w900,
    color: kPrimaryColor,
    letterSpacing: -0.5.sp,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 4,
        offset: Offset(0, 4),
      ),
    ],
  );
}

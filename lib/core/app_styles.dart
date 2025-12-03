import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/theme/app_theme.dart';

class AppStyles {
  static TextStyle textStyle36Bold(BuildContext context) => TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w900,
    color: context.appTheme.primaryColor,
  );
  
  static TextStyle textStyle18SemiBold(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: context.appTheme.secondaryColor,
  );
  
  static TextStyle textStyle14Regular(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: context.appTheme.textPrimaryColor,
  );
  
  static TextStyle textStyle15Medium(BuildContext context) => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: context.appTheme.greyColor,
  );
  
  static TextStyle textStyle20SemiBold(BuildContext context) => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: context.appTheme.textPrimaryColor,
  );

  static TextStyle textStyle36BoldWithShadow(BuildContext context) => TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w900,
    color: context.appTheme.primaryColor,
    letterSpacing: -0.5.sp,
    shadows: [
      Shadow(
        color: context.appTheme.shadowColor.withOpacity(0.25),
        blurRadius: 4,
        offset: Offset(0, 4),
      ),
    ],
  );
}

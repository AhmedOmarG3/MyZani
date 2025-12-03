import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/theme/app_theme.dart';

OutlineInputBorder getOutlineInputBorder({
    Color? color,
    double borderRedius = 8,
    BuildContext? context,
  }) {
    final borderColor = color ?? (context?.appTheme.borderColor ?? const Color(0xffE8ECF4));
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRedius.r),
      borderSide: BorderSide(color: borderColor, width: 2.w),
    );
  }

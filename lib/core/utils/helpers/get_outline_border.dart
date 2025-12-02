import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

OutlineInputBorder getOutlineInputBorder({
    Color color = const Color(0xffE8ECF4),double borderRedius=8
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRedius.r),
      borderSide: BorderSide(color: color, width: 2.w),
    );
  }

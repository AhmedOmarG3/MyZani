import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';
import 'package:myzani/core/utils/helpers/get_outline_border.dart';

class CustomAddTransactionTextFeild extends StatelessWidget {
  const CustomAddTransactionTextFeild({
    super.key,
    required this.title,
    this.contentpaddong,
    this.keyboardType,
    this.maxlines,
    
  });

  final String title;
  final EdgeInsetsGeometry? contentpaddong;
  final TextInputType? keyboardType;
  final int? maxlines;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
          child: Text(
            title,
            style: AppStyles.textStyle14Regular.copyWith(
              color: const Color(0xff666666),
            ),
          ),
        ),
        TextField(
          maxLines: maxlines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: contentpaddong,
            border: getOutlineInputBorder(
              borderRedius: 15.r,
              color: const Color(0xffDDDDDD),
            ),
            focusedBorder: getOutlineInputBorder(
              borderRedius: 15.r,
              color: kPrimaryColor,
            ),
            enabledBorder: getOutlineInputBorder(
              borderRedius: 15.r,
              color: const Color(0xffDDDDDD),
            ),
          ),
        ),
      ],
    );
  }
}

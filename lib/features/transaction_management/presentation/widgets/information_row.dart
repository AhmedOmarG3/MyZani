import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({
    super.key,
    required this.title,
    required this.value,
    required this.titleColor,
    required this.valueColor,
  });
  final String title, value;
  final Color titleColor, valueColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle15Medium.copyWith(
            color: titleColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: AppStyles.textStyle15Medium.copyWith(
            color: valueColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

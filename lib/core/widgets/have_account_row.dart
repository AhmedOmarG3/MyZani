import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

class HaveAccountRow extends StatelessWidget {
  const HaveAccountRow({
    super.key,
    required this.onTap,
    required this.text,
    required this.actionText,
  });
  final Function() onTap;
  final String text;
  final String actionText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.textStyle14Regular.copyWith(fontSize: 15.sp),
          ),
          Text(
            actionText,
            style: AppStyles.textStyle14Regular.copyWith(
              color: kPrimaryColor,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}

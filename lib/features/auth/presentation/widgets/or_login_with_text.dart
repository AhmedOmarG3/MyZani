import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

class OrLoginWithText extends StatelessWidget {
  const OrLoginWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffE8ECF4),
            thickness: 1.w,
            endIndent: 10.w,
          ),
        ),
        Text(
          'Or Login with',
          style: AppStyles.textStyle14Regular.copyWith(
            color: kDrakGreyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffE8ECF4),
            thickness: 1.w,
            indent: 10.w,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';

class OrLoginWithText extends StatelessWidget {
  const OrLoginWithText({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: theme.borderColor,
            thickness: 1.w,
            endIndent: 10.w,
          ),
        ),
        Text(
          text,
          style: AppStyles.textStyle14Regular(context).copyWith(
            color: theme.darkGreyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Divider(
            color: theme.borderColor,
            thickness: 1.w,
            indent: 10.w,
          ),
        ),
      ],
    );
  }
}

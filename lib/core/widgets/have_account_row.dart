import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';

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
    final theme = context.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.textStyle14Regular(context).copyWith(fontSize: 15.sp),
          ),
          Text(
            actionText,
            style: AppStyles.textStyle14Regular(context).copyWith(
              color: theme.primaryColor,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}

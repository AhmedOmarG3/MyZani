import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';

class IncomeCardItem extends StatelessWidget {
  const IncomeCardItem({
    super.key,
    required this.title,
    required this.icon,
    required this.amount,
  });
  final String title;
  final IconData icon;
  final String amount;
  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.secondaryColor.withOpacity(.15),
              ),
              child: Center(
                child: Icon(icon, color: theme.secondaryColor, size: 18.sp),
              ),
            ),
            Text(
              title,
              style: AppStyles.textStyle15Medium(context).copyWith(
                color: theme.incomeCardBackgroundColor,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        Text(
          amount,
          style: AppStyles.textStyle20SemiBold(context).copyWith(color: theme.secondaryColor),
        ),
      ],
    );
  }
}

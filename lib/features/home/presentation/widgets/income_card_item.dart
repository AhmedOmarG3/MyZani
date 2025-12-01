import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

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
                color: kSecondryColor.withOpacity(.15),
              ),
              child: Center(
                child: Icon(icon, color: kSecondryColor, size: 18.sp),
              ),
            ),
            Text(
              title,
              style: AppStyles.textStyle15Medium.copyWith(
                color: Color(0xffD0E5E4),
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        Text(
          amount,
          style: AppStyles.textStyle20SemiBold.copyWith(color: kSecondryColor),
        ),
      ],
    );
  }
}

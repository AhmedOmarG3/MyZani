import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/more_dots_widget.dart';

class TotalBalanceRow extends StatelessWidget {
  const TotalBalanceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Text(
              'Total Balance',
              style: AppStyles.textStyle15Medium(context).copyWith(
                color: theme.secondaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: theme.secondaryColor,
                  size: 15.sp,
                ),
              ),
            ),
          ],
        ),
        MoreDotsWidget(),
      ],
    );
  }
}

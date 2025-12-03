import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';

class TransactionDetailsRow extends StatelessWidget {
  const TransactionDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transaction Details',
          style: AppStyles.textStyle20SemiBold(context).copyWith(color: theme.textPrimaryColor),
        ),

        Transform.rotate(
          angle: -math.pi / 2,
          child: Icon(
            Icons.arrow_forward_ios,
            color: theme.textPrimaryColor,
            size: 18.sp,
          ),
        ),
      ],
    );
  }
}

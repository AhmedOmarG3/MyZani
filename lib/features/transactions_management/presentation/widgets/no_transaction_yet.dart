import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';

class NoTransactionYet extends StatelessWidget {
  const NoTransactionYet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'No transactions yet !',
            style: AppStyles.textStyle20SemiBold(
              context,
            ).copyWith(color: context.appTheme.primaryColor),
          ),
          Text(
            'Start adding transactions',
            style: AppStyles.textStyle20SemiBold(
              context,
            ).copyWith(color: context.appTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}

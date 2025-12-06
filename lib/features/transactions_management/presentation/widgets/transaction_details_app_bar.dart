import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/app_bar_container.dart';

class TransactionDetailsAppBar extends StatelessWidget {
  const TransactionDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Transaction Details',
            style: AppStyles.textStyle20SemiBold(
              context,
            ).copyWith(fontSize: 30.sp, color: context.appTheme.secondaryColor),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}

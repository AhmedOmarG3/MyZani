import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';

class TransactionHeaderColumn extends StatelessWidget {
  const TransactionHeaderColumn({super.key, required this.transactionEntity});

  final TransactionEntity transactionEntity;
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsCubit>().state;
    final theme = context.appTheme;
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: theme.surfaceColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(transactionEntity.category.imagePath),
        ),
        SizedBox(height: 10.h),
        Container(
          width: 120.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: theme.accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(
              transactionEntity.type.name,
              style: AppStyles.textStyle15Medium(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: theme.accentColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          '${settings.currencySymbol} ${transactionEntity.amount}',
          style: AppStyles.textStyle20SemiBold(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: theme.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}

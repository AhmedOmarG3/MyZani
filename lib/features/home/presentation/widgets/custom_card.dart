import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/home/presentation/widgets/income_card_item.dart';
import 'package:myzani/features/home/presentation/widgets/total_balance_row.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final currencySymbol = context.watch<SettingsCubit>().state.currencySymbol;
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 380.w,
        height: 220.h,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
          color: theme.cardPrimaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 30.h,
            right: 20.w,
            bottom: 10.h,
          ).copyWith(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TotalBalanceRow(),
              SizedBox(height: 10.h),
              Text(
                '$currencySymbol 2,548.00',
                style: AppStyles.textStyle36Bold(
                  context,
                ).copyWith(color: theme.secondaryColor, fontSize: 30.sp),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IncomeCardItem(
                    icon: Icons.arrow_downward_rounded,

                    amount: '$currencySymbol 1,840.00',
                    title: 'Income',
                  ),
                  IncomeCardItem(
                    icon: Icons.arrow_upward_rounded,
                    amount: '$currencySymbol 2,548.00',
                    title: 'Expense',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

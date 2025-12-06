import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/presentation/views/add_transaction_view.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.transactionEntity,
    required this.onTap,
  });
  final TransactionEntity transactionEntity;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final currencySymbol = context.watch<SettingsCubit>().state.currencySymbol;
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: theme.listTileBackgroundColor,
          ),
          child: Center(
            child: Image.asset(transactionEntity.category.imagePath),
          ),
        ),
        title: Text(
          transactionEntity.title,
          style: AppStyles.textStyle15Medium(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: theme.textPrimaryColor,
          ),
        ),
        subtitle: Text(
          '${DateFormat('yyyy-MM-dd').format(transactionEntity.date)}    ${DateFormat('hh:mm a').format(transactionEntity.date)}',
          style: AppStyles.textStyle14Regular(
            context,
          ).copyWith(color: theme.greyColor),
        ),
        trailing: Text(
          '${getCurrencySymbol(transactionEntity)}$currencySymbol ${transactionEntity.amount}',
          style: AppStyles.textStyle15Medium(context).copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: transactionEntity.type == TransactionType.income
                ? const Color(0XFF25A969)
                : const Color.fromARGB(255, 210, 27, 27),
          ),
        ),
      ),
    );
  }
}

String getCurrencySymbol(TransactionEntity transactionEntity) {
  if (transactionEntity.type == TransactionType.income) {
    return '+';
  } else {
    return '-';
  }
}

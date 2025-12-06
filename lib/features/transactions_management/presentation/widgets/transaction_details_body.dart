import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/action_row.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/information_row.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/transaction_details_row.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/transaction_header_column.dart';

class TransactionDetailsBody extends StatelessWidget {
  const TransactionDetailsBody({super.key, required this.transactionEntity});

  final TransactionEntity transactionEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionHeaderColumn(transactionEntity: transactionEntity),
        SizedBox(height: 10.h),
        TransactionDetailsRow(),
        SizedBox(height: 20.h),
        Column(
          spacing: 10.h,
          children: [
            InformationRow(
              title: 'Status',
              value: transactionEntity.type.name,
              titleColor: context.appTheme.textSecondaryColor,
              valueColor: context.appTheme.primaryColor,
            ),
            InformationRow(
              title: 'Category',
              value: transactionEntity.category.name,
              titleColor: context.appTheme.textSecondaryColor,
              valueColor: context.appTheme.textPrimaryColor,
            ),
            InformationRow(
              title: 'Date',
              value: DateFormat('yyyy-MM-dd').format(transactionEntity.date),
              titleColor: context.appTheme.textSecondaryColor,
              valueColor: context.appTheme.textPrimaryColor,
            ),
            InformationRow(
              title: 'Time',
              value: DateFormat('hh:mm a').format(transactionEntity.date),
              titleColor: context.appTheme.textSecondaryColor,
              valueColor: context.appTheme.textPrimaryColor,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Divider(color: context.appTheme.greyColor, thickness: 1.w),
        Column(
          children: [
            Text('Description', style: AppStyles.textStyle20SemiBold(context)),
            SizedBox(height: 15.h),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.appTheme.descriptionBackgroundColor.withOpacity(
                  0.1,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Text(
                maxLines: 2,
                transactionEntity.description,
                style: AppStyles.textStyle18SemiBold(
                  context,
                ).copyWith(color: context.appTheme.textPrimaryColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Divider(color: context.appTheme.greyColor, thickness: 1.w),
        SizedBox(height: 10),
        ActionRow(),
      ],
    );
  }
}

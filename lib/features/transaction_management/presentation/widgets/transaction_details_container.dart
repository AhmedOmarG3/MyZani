import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/transaction_management/presentation/widgets/action_row.dart';
import 'package:myzani/features/transaction_management/presentation/widgets/information_row.dart';
import 'package:myzani/features/transaction_management/presentation/widgets/transaction_details_row.dart';
import 'package:myzani/features/transaction_management/presentation/widgets/transaction_header_column.dart';

class TransactionDetailsContainer extends StatelessWidget {
  const TransactionDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,

      decoration: BoxDecoration(
        color: context.appTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            TransactionHeaderColumn(),
            SizedBox(height: 10.h),
            TransactionDetailsRow(),
            SizedBox(height: 20.h),
            Column(
              spacing: 10.h,
              children: [
                InformationRow(
                  title: 'Status',
                  value: 'Income',
                  titleColor: context.appTheme.textSecondaryColor,
                  valueColor: context.appTheme.primaryColor,
                ),
                InformationRow(
                  title: 'Category',
                  value: 'Food',
                  titleColor: context.appTheme.textSecondaryColor,
                  valueColor: context.appTheme.textPrimaryColor,
                ),
                InformationRow(
                  title: 'Date',
                  value: 'Feb 30, 2022',
                  titleColor: context.appTheme.textSecondaryColor,
                  valueColor: context.appTheme.textPrimaryColor,
                ),
                InformationRow(
                  title: 'Time',
                  value: '10:00 AM',
                  titleColor: context.appTheme.textSecondaryColor,
                  valueColor: context.appTheme.textPrimaryColor,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Divider(color: context.appTheme.greyColor, thickness: 1.w),
            Column(
              children: [
                Text(
                  'Description',
                  style: AppStyles.textStyle20SemiBold(context),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.appTheme.descriptionBackgroundColor
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    maxLines: 2,
                    'Food delivery from Amazon, 3 items, 1 quantity, 3.00 USD',
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
        ),
      ),
    );
  }
}

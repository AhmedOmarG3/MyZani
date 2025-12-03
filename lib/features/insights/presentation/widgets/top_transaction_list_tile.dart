import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';

class TopTransactionListTile extends StatelessWidget {
  const TopTransactionListTile({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final currencySymbol = context.watch<SettingsCubit>().state.currencySymbol;
    return SizedBox(
      height: 88.h,
      width: double.infinity,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        tileColor: theme.topTransactionsBackgroundColor,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: Center(child: Image.asset(AppImages.imagesYoutube)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            'Youtube',
            style: AppStyles.textStyle15Medium(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textPrimaryColor,
            ),
          ),
        ),
        subtitle: Text(
          'Jan 16, 2022',
          style: AppStyles.textStyle14Regular(
            context,
          ).copyWith(color: theme.greyColor),
        ),
        trailing: Text(
          '+$currencySymbol 850.00',
          style: AppStyles.textStyle15Medium(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0XFF25A969),
          ),
        ),
      ),
    );
  }
}

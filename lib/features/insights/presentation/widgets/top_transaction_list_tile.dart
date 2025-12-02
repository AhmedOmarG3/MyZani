import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

class TopTransactionListTile extends StatelessWidget {
  const TopTransactionListTile({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.h,
      width: double.infinity,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        tileColor: Color(0xffFBFBFB),
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
            style: AppStyles.textStyle15Medium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Color(0XFF000000),
            ),
          ),
        ),
        subtitle: Text(
          'Jan 16, 2022',
          style: AppStyles.textStyle14Regular.copyWith(color: kGreyColor),
        ),
        trailing: Text(
          '+\$850.00',
          style: AppStyles.textStyle15Medium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Color(0XFF25A969),
          ),
        ),
      ),
    );
  }
}

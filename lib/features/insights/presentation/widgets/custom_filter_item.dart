import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

class CustomFilterItem extends StatelessWidget {
  const CustomFilterItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
  });
  final void Function() onTap;
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 90.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : kSecondryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.textStyle14Regular.copyWith(
              color: isSelected ? kSecondryColor : kGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}

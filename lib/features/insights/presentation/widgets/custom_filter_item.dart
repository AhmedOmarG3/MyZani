import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';

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
    final theme = context.appTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 90.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.textStyle14Regular(context).copyWith(
              color: isSelected ? theme.secondaryColor : theme.greyColor,
            ),
          ),
        ),
      ),
    );
  }
}

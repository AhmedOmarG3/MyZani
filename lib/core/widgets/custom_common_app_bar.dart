import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/custom_arrow_back_button.dart';
import 'package:myzani/features/home/presentation/widgets/custom_home_app_bar_container.dart';

class CustomCommonAppBar extends StatelessWidget {
  const CustomCommonAppBar({
    super.key,
    required this.title,
    required this.lastIcon,
  });
  final String title;
  final Widget lastIcon;
  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return CustomHomeAppBarContainer(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomArrowBackButton(),
            Text(
              title,
              style: AppStyles.textStyle20SemiBold(context).copyWith(
                fontSize: 25.sp,
                color: theme.secondaryColor,
              ),
            ),
            lastIcon,
          ],
        ),
      ),
    );
  }
}

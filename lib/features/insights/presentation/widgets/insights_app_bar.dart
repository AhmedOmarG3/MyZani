import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/custom_arrow_back_button.dart';

class InsightsAppBar extends StatelessWidget {
  const InsightsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowBackButton(color: theme.textPrimaryColor, height: 18.h),
        Text(
          'Spending Insights',
          style: AppStyles.textStyle18SemiBold(
            context,
          ).copyWith(color: theme.textPrimaryColor),
        ),
        SvgPicture.asset(
          AppImages.imagesDownload,
          height: 22.h,
          width: 22.w,
          color: theme.textPrimaryColor,
        ),
      ],
    );
  }
}

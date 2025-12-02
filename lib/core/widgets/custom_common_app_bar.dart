import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';
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
    return CustomHomeAppBarContainer(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: SvgPicture.asset(
                  AppImages.imagesBackArrow,
                  color: kSecondryColor,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
            Text(
              title,
              style: AppStyles.textStyle20SemiBold.copyWith(
                fontSize: 25.sp,
                color: kSecondryColor,
              ),
            ),
            lastIcon,
          ],
        ),
      ),
    );
  }
}

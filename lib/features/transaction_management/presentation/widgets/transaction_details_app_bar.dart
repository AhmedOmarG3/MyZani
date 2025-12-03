import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/app_bar_container.dart';
import 'package:myzani/core/widgets/more_dots_widget.dart';

class TransactionDetailsAppBar extends StatelessWidget {
  const TransactionDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.go(AppRouter.home),
              child: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: SvgPicture.asset(
                  AppImages.imagesBackArrow,
                  color: context.appTheme.secondaryColor,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
            Text(
              'Transaction Details',
              style: AppStyles.textStyle20SemiBold(context).copyWith(
                fontSize: 25.sp,
                color: context.appTheme.secondaryColor,
              ),
            ),
            MoreDotsWidget(),
          ],
        ),
      ),
    );
  }
}

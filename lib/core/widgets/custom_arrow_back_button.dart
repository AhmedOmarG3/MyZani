import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/theme/app_theme.dart';

class CustomArrowBackButton extends StatelessWidget {
  const CustomArrowBackButton({
    super.key, this.color, this.height,
  });
  final double? height ;
final Color? color ;
  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return GestureDetector(
      onTap: () => context.pop(),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: SvgPicture.asset(
          AppImages.imagesBackArrow,
          color:color?? theme.secondaryColor,
          height:height?? 20.h,
          width: 20.w,
        ),
      ),
    );
  }
}

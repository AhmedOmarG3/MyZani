import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myzani/core/theme/app_theme.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.size,
    required this.onPressed,
    required this.imagePath, this.height,
  });

  final Size size;
  final void Function() onPressed;
  final String imagePath;
  final double? height ;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return IconButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(size),
        side: WidgetStateProperty.all(
          BorderSide(color: theme.borderColor, width: 2.w),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(imagePath, height: height??18.h,),
    );
  }
}

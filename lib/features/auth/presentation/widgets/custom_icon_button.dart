import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return IconButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(size),
        side: WidgetStateProperty.all(
          BorderSide(color: Color(0xffE8ECF4), width: 2.w),
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

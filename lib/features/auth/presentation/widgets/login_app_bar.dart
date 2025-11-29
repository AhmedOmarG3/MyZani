import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/features/auth/presentation/widgets/custom_icon_button.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          size: Size(45.w, 45.h),
          imagePath: AppImages.imagesBackArrow,
          onPressed: onPressed,
        ),
      ],
    );
  }
}

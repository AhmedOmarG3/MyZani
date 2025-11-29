import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/features/auth/presentation/widgets/custom_icon_button.dart';

class LoginWithRow extends StatelessWidget {
  const LoginWithRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          child: CustomIconButton(
            size: Size(115.w, 60.h),
            onPressed: () {},
            height: 30.h,
            imagePath: AppImages.imagesFacebook,
          ),
        ),
        Expanded(
          child: CustomIconButton(
            size: Size(115.w, 60.h),
            onPressed: () {},
            height: 30.h,
            imagePath: AppImages.imagesGoogle,
          ),
        ),
        Expanded(
          child: CustomIconButton(
            size: Size(115.w, 60.h),
            onPressed: () {},
            height: 30.h,
            imagePath: AppImages.imagesIphon,
          ),
        ),
      ],
    );
  }
}

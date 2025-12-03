import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';
import 'package:myzani/core/widgets/have_account_row.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 620.h,
            width: double.infinity,
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppImages.imagesSplashShape,
                  height: 600.h,
                  width: 414.w,
                ),
                Positioned(
                  top: 130.h,
                  left: 30.w,
                  child: Image.asset(AppImages.imagesGroub),
                ),
                Positioned(
                  top: 130.h,
                  left: 30.w,
                  child: Image.asset(AppImages.imagesCoint),
                ),
                Positioned(
                  top: 180.h,
                  right: 50.w,
                  child: Image.asset(AppImages.imagesDonut),
                ),
              ],
            ),
          ),
          Text(
            'spend smarter \n save more',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle36BoldWithShadow(context),
          ),
          SizedBox(height: 20.h),
          CustomTextButton(fixedSize: Size(358.w, 67.h),
            onPressed: () {
              context.push(AppRouter.signUp);
            },text: "Get Started",),
          SizedBox(height: 20.h),
          HaveAccountRow(
            text: 'Already Have Account?',
            actionText: ' Login',
            onTap: () {
            context.push(AppRouter.login);
          }),
        ],
      ),
    );
  }
}

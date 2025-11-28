import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/colors.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnBoardingViewBody());
  }
}
class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: SvgPicture.asset(AppImages.imagesSplashMan),
        ),
        Positioned(
          top: 100,
          right: 30,
          child: SvgPicture.asset(AppImages.imagesCoint),
        ),
        Positioned(
          top: 100,
          left: 30,
          child: SvgPicture.asset(AppImages.imagesDonatsvg),
        ),
        Positioned(
          top: 200,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            AppImages.imagesSplashShape,
            height: 600.h,
            width: 414.w,
          ),
        ),
        Positioned(
          bottom: 150,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.center,
                'spend smarter \n save more',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 36.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextButton(onPressed: () {
               
                
              }),
            ],
          ),
        ),
      ],
    );
  }
}


class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff69AEA9), Color(0xff3F8782)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(358.w, 67.h),
          elevation: 5,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
        child: Center(
          child: Text(
            "Get Started",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: kSecondryColor,
            ),
          ),
        ),
      ),
    );
  }
}

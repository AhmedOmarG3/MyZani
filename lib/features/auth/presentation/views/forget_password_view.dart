import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';
import 'package:myzani/core/widgets/have_account_row.dart';
import 'package:myzani/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:myzani/features/auth/presentation/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ForgetPasswordViewBody());
  }
}

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          children: [
            ForgetPasswordAppBar(
              onPressed: () {
                context.pop();
              },
            ),
            SizedBox(height: 50.h),
            Text(
              "Enter your email and we’ll \nsend you a reset link.",
              style: AppStyles.textStyle36Bold.copyWith(fontSize: 30.sp),
            ),
            SizedBox(height: 20.h),
            SvgPicture.asset(AppImages.imagesForgetPassword, height: 200.h),
            SizedBox(height: 40.h),
            CustomTextFormField(
              hint: 'Enter your Email',
              isPasswordTextField: false,
            ),
            SizedBox(height: 30.h),
            CustomTextButton(
              onPressed: () {},
              fixedSize: Size(1.sw, 61.h),
              text: ' Send Reset Link',
              borderRedius: 8,
            ),
            SizedBox(height: 20.h),
            HaveAccountRow(
              onTap: () {
                context.pop();
              },
              text: "Remembered your password? ",
              actionText: "Login Now",
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class ForgetPasswordAppBar extends StatelessWidget {
  const ForgetPasswordAppBar({super.key, required this.onPressed});

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 50.w,
      children: [
        CustomIconButton(
          size: Size(45.w, 45.h),
          imagePath: AppImages.imagesBackArrow,
          onPressed: onPressed,
        ),
        Text(
          'Forgot Password',
          style: AppStyles.textStyle36Bold.copyWith(fontSize: 25.sp),
        ),
      ],
    );
  }
}

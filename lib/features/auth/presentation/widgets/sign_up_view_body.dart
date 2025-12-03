import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';
import 'package:myzani/core/widgets/have_account_row.dart';
import 'package:myzani/features/auth/presentation/widgets/login_app_bar.dart';
import 'package:myzani/features/auth/presentation/widgets/login_with_row.dart';
import 'package:myzani/features/auth/presentation/widgets/or_login_with_text.dart';
import 'package:myzani/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginAppBar(
              onPressed: () {
                context.pop();
              },
            ),
            SizedBox(height: 33.h),
            Text(
              'Join us now!We’re glad \n you’re here!',

              style: AppStyles.textStyle36Bold(context).copyWith(fontSize: 30.sp),
            ),
            SizedBox(height: 35.h),
            SignUpForm(),
            SizedBox(height: 15.h),
            SizedBox(height: 15.h),
            CustomTextButton(
              onPressed: () {},
              fixedSize: Size(1.sw, 61.h),
              text: 'Sign Up',
              borderRedius: 8,
            ),
            SizedBox(height: 33.h),
            OrLoginWithText(text: 'Or Sign Up with'),
            SizedBox(height: 33.h),
            LoginWithRow(),
            SizedBox(height: 20.h),
            HaveAccountRow(
              onTap: () {
                context.push(AppRouter.login);
              },
              text: "Already have an account? ",
              actionText: 'Sign In',
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

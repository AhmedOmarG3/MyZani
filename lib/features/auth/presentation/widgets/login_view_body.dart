import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';
import 'package:myzani/core/widgets/have_account_row.dart';
import 'package:myzani/features/auth/presentation/widgets/login_app_bar.dart';
import 'package:myzani/features/auth/presentation/widgets/login_form.dart';
import 'package:myzani/features/auth/presentation/widgets/login_with_row.dart';
import 'package:myzani/features/auth/presentation/widgets/or_login_with_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            LoginAppBar(onPressed: () {
              context.pop();
            }),
            SizedBox(height: 33.h),
            Text(
              'Welcome back! Glad to \n see you, Again!',
              style: AppStyles.textStyle36Bold.copyWith(fontSize: 30.sp),
            ),
            SizedBox(height: 35.h),
            LoginForm(),
            SizedBox(height: 15.h),
            ForgetPasswordAction(
              onTap: () {
                context.push(AppRouter.forgetPassword);
              },
            ),
            SizedBox(height: 15.h),
            CustomTextButton(
              onPressed: () {},
              fixedSize: Size(1.sw, 61.h),
              text: 'Login',
              borderRedius: 8,
            ),
            SizedBox(height: 33.h),
            OrLoginWithText(
              text: 'Or Login with',
            ),
            SizedBox(height: 33.h),
            LoginWithRow(),
            SizedBox(height: 160.h),
            HaveAccountRow(
              onTap: () {
                context.push(AppRouter.signUp);
              },
              text: "Don’t have an account? ",
              actionText: 'Register Now',
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class ForgetPasswordAction extends StatelessWidget {
  const ForgetPasswordAction({
    super.key, required this.onTap,
  });
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          'Forgot Password ?',
          style: AppStyles.textStyle14Regular.copyWith(
            color: kDrakGreyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

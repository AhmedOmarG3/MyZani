import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/features/auth/presentation/widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 20.h,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomTextFormField(
            hint: 'Enter your Name',
            isPasswordTextField: false,
          ),
          CustomTextFormField(
            hint: 'Enter your Email',
            isPasswordTextField: false,
          ),

          CustomTextFormField(
            hint: 'Enter your Password',
            isPasswordTextField: true,
          ),
          CustomTextFormField(
            hint: 'Confirm your Password',
            isPasswordTextField: true,
          ),
        ],
      ),
    );
    ;
  }
}

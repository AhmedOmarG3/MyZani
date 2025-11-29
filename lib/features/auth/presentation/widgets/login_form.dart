import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/features/auth/presentation/widgets/custom_text_field.dart' show CustomTextFormField;

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomTextFormField(
            hint: 'Enter your Email',
            isPasswordTextField: false,
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            hint: 'Enter your Password',
            isPasswordTextField: true,
          ),
        ],
      ),
    );
  }
}

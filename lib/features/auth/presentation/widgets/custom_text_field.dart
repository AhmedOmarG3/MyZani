import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/utils/helpers/get_outline_border.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.isPasswordTextField,
    required this.hint,
  });
  final bool isPasswordTextField;
  final String hint;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPasswordTextField ? isObscure : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
        fillColor: Color(0xffF7F8F9),
        filled: true,
        suffixIcon: widget.isPasswordTextField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
        focusedBorder: getOutlineInputBorder(),
        enabledBorder: getOutlineInputBorder(),
        hintText: widget.hint,

        hintStyle: AppStyles.textStyle15Medium,
      ),
    );
  }
}

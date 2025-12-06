import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/utils/helpers/get_outline_border.dart';

class CustomAddTransactionTextFeild extends StatelessWidget {
  const CustomAddTransactionTextFeild({
    super.key,
    required this.title,
    this.contentpaddong,
    this.keyboardType,
    this.maxlines, required this.controller,required this.validator,
    
  });
final String? Function(String?)? validator;
  final String title;
  final EdgeInsetsGeometry? contentpaddong;
  final TextInputType? keyboardType;
  final int? maxlines;
final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
          child: Text(
            title,
            style: AppStyles.textStyle14Regular(context).copyWith(
              color: theme.textSecondaryColor,
            ),
          ),
        ),
        TextFormField(
          validator:validator,
          controller: controller,
          maxLines: maxlines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: contentpaddong,
            border: getOutlineInputBorder(
              borderRedius: 15.r,
              color: theme.borderLightColor,
              context: context,
            ),
            focusedBorder: getOutlineInputBorder(
              borderRedius: 15.r,
              color: theme.primaryColor,
              context: context,
            ),
            enabledBorder: getOutlineInputBorder(
              borderRedius: 15.r,
              color: theme.borderLightColor,
              context: context,
            ),
          ),
        ),
      ],
    );
  }
}

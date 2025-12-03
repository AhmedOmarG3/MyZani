import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/utils/helpers/get_outline_border.dart';

class CustomDateTextField extends StatefulWidget {
  const CustomDateTextField({
    super.key,
    required this.title,
    required this.focusColor,
  });

  final String title;
  final Color focusColor;

  @override
  State<CustomDateTextField> createState() => _CustomDateTextFieldState();
}

class _CustomDateTextFieldState extends State<CustomDateTextField> {
  final TextEditingController controller = TextEditingController();

  Future<void> pickDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      controller.text = "${newDate.year}-${newDate.month}-${newDate.day}";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
          child: Text(
            widget.title,
            style: AppStyles.textStyle14Regular(context).copyWith(
              color: theme.textSecondaryColor,
            ),
          ),
        ),
        TextField(
          controller: controller,
          readOnly: true,
          onTap: pickDate,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.calendar_month),
            border: getOutlineInputBorder(
              borderRedius: 15.r,
              color: theme.borderLightColor,
              context: context,
            ),
            focusedBorder: getOutlineInputBorder(
              borderRedius: 15.r,
              color: widget.focusColor,
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
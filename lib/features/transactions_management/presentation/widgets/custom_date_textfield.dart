import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/utils/helpers/get_outline_border.dart';

class CustomDateTextField extends StatefulWidget {
  const CustomDateTextField({super.key, required this.title, required this.controller, required this.validator});

  final String title;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  State<CustomDateTextField> createState() => _CustomDateTextFieldState();
}

class _CustomDateTextFieldState extends State<CustomDateTextField> {


 Future<void> pickDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      // إضافة الوقت الحالي للتاريخ المختار
      final now = DateTime.now();
      final dateWithTime = DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        now.hour,
        now.minute,
        now.second,
      );

      // عرض التاريخ + الوقت بشكل نظيف
      widget.controller.text = DateFormat('yyyy-MM-dd HH:mm').format(dateWithTime);

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
            style: AppStyles.textStyle14Regular(
              context,
            ).copyWith(color: theme.textSecondaryColor),
          ),
        ),
        TextFormField(
          validator: widget.validator,
          controller:widget. controller,
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
          child: Text(
            widget.title,
            style: AppStyles.textStyle14Regular.copyWith(
              color: const Color(0xff666666),
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
              color: const Color(0xffDDDDDD),
            ),
            focusedBorder: getOutlineInputBorder(
              borderRedius: 15.r,
              color: widget.focusColor,
            ),
            enabledBorder: getOutlineInputBorder(
              borderRedius: 15.r,
              color: const Color(0xffDDDDDD),
            ),
          ),
        ),
      ],
    );
  }
}
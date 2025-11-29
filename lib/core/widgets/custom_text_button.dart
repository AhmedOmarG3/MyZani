import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.fixedSize,
    required this.text, this.borderRedius,
  });
  final void Function() onPressed;
  final Size fixedSize;
  final String text;
  final double? borderRedius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 9),
          ),
        ],
        gradient: LinearGradient(
          colors: [Color(0xff69AEA9), Color(0xff3F8782)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(borderRedius ?? 40.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: fixedSize,

          backgroundColor: Colors.transparent,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRedius ?? 40.r),
          ),
        ),
        child: Center(child: Text(text, style: AppStyles.textStyle18SemiBold)),
      ),
    );
  }
}

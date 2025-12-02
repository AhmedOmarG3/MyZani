import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
          onPressed: () {},
          fixedSize: Size(140.w, 20),
          text: 'Edit',
          borderRedius: 8,
        ),
        CustomTextButton(
          onPressed: () {},
          fixedSize: Size(140.w, 20),
          text: 'Delete',
          gradientColors: [Color(0xffFF6B6B), Color(0xffC62828)],
          borderRedius: 8,
        ),
      ],
    );
  }
}

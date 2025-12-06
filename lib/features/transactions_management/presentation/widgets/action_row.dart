import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
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
          gradientColors: theme.expenseGradientColors,
          borderRedius: 8,
        ),
      ],
    );
  }
}

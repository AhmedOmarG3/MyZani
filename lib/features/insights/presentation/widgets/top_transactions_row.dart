import 'package:flutter/material.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';

class TopTransactionsRow extends StatelessWidget {
  const TopTransactionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Spending ',
          style: AppStyles.textStyle18SemiBold(context).copyWith(color: theme.textPrimaryColor),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'View All',
            style: AppStyles.textStyle15Medium(context).copyWith(
              color: theme.darkGreyColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myzani/core/app_styles.dart';

class TopTransactionsRow extends StatelessWidget {
  const TopTransactionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Spending ',
          style: AppStyles.textStyle18SemiBold.copyWith(color: Colors.black),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'View All',
            style: AppStyles.textStyle15Medium.copyWith(
              color: const Color.fromARGB(255, 108, 110, 113),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

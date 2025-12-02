import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';

class TransactionDetailsRow extends StatelessWidget {
  const TransactionDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transaction Details',
          style: AppStyles.textStyle20SemiBold.copyWith(color: Colors.black),
        ),

        Transform.rotate(
          angle: -math.pi / 2,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 18.sp,
          ),
        ),
      ],
    );
  }
}

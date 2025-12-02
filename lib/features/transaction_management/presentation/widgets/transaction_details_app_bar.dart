import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';
import 'package:myzani/core/widgets/app_bar_container.dart';
import 'package:myzani/core/widgets/custom_arrow_back_button.dart';
import 'package:myzani/core/widgets/more_dots_widget.dart';

class TransactionDetailsAppBar extends StatelessWidget {
  const TransactionDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomArrowBackButton(),
            Text(
              'Transaction Details',
              style: AppStyles.textStyle20SemiBold.copyWith(
                fontSize: 25.sp,
                color: kSecondryColor,
              ),
            ),
            MoreDotsWidget(),
          ],
        ),
      ),
    );
  }
}

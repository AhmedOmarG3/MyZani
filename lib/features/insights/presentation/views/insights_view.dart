import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/features/insights/presentation/widgets/filteration_row.dart';
import 'package:myzani/features/insights/presentation/widgets/insights_app_bar.dart';
import 'package:myzani/features/insights/presentation/widgets/scrollable_chart.dart';
import 'package:myzani/features/insights/presentation/widgets/top_transactions.dart';
import 'package:myzani/features/insights/presentation/widgets/transaction_type_drop_down.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 70.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InsightsAppBar(),
            SizedBox(height: 30.h),
            FiltertionRow(),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTransactionTypeDropDown(),
            ),
            SizedBox(height: 10.h),
            ScrollableLineChart(),
            SizedBox(height: 30.h),
            TopTransactions(),
          ],
        ),
      ),
    );
  }
}

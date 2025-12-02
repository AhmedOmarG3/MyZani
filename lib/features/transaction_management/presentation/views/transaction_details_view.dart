import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/features/transaction_management/presentation/widgets/transaction_details_app_bar.dart';
import 'package:myzani/features/transaction_management/presentation/widgets/transaction_details_container.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TransactionDetailsAppBar(),
        Positioned(top: 180.h, child: TransactionDetailsContainer()),
      ],
    );
  }
}

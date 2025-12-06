import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/transaction_details_app_bar.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/transaction_details_container.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Container(color: Colors.transparent),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 1.sh * 0.35,
          child: TransactionDetailsAppBar(),
        ),
        Positioned(top: 180.h, child: TransactionDetailsContainer()),
      ],
    );
  }
}

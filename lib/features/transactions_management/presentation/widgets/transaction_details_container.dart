import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/get_transaction/get_transaction_cubit.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/no_transaction_yet.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/transaction_details_body.dart';

class TransactionDetailsContainer extends StatelessWidget {
  const TransactionDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,

      decoration: BoxDecoration(
        color: context.appTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: BlocBuilder<GetTransactionCubit, GetTransactionState>(
          builder: (context, state) {
            if (state is TransactionIsEmpty || state is NoTransactionYetState) {
              return NoTransactionYet();
            } else if (state is TransactionLoaded) {
              final transactionEntity = state.transactionEntity;
              return TransactionDetailsBody(
                transactionEntity: transactionEntity,
              );
            } else if (state is LastTransactionLoaded) {
              final transactionEntity = state.transactionEntity;
              return TransactionDetailsBody(
                transactionEntity: transactionEntity,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

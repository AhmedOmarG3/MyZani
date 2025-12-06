import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';
import 'package:myzani/features/home/presentation/blocs/home/home_cubit.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/delete_transaction/delete_transaction_cubit.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key, required this.transactionEntity});
  final TransactionEntity transactionEntity;
  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      spacing: 20.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
          onPressed: () {
             
    GoRouter.of(context).push(
      AppRouter.addTrasaction,
      extra: transactionEntity,
    );
          },
          fixedSize: Size(140.w, 20),
          text: 'Edit',
          borderRedius: 8,
        ),
        BlocListener<DeleteTransactionCubit, DeleteTransactionState>(
          listener: (context, state) {
            if (state is DeleteTransactionSuccess) {
              final cubit = context.read<HomeCubit>();
              cubit.loadHomeData();
              cubit.changePage(0);
            }
            if (state is DeleteTransactionError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: CustomTextButton(
            onPressed: () {
              context.read<DeleteTransactionCubit>().deleteTransaction(
                id: transactionEntity.id,
              );
            },
            fixedSize: Size(140.w, 20),
            text: 'Delete',
            gradientColors: theme.expenseGradientColors,
            borderRedius: 8,
          ),
        ),
      ],
    );
  }
}

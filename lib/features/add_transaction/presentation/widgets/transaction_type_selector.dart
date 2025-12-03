import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/add_transaction/presentation/views/add_transaction_view.dart';

class TransactionTypeSelector extends StatelessWidget {
  const TransactionTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  final TransactionType selectedType;
  final ValueChanged<TransactionType> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text("Expense"),
          labelStyle: TextStyle(
            color: selectedType == TransactionType.expense
                ? theme.secondaryColor
                : theme.textPrimaryColor,
          ),
          checkmarkColor: theme.secondaryColor,
          selected: selectedType == TransactionType.expense,
          selectedColor: theme.expenseColor,
          onSelected: (val) {
            onChanged(TransactionType.expense);
          },
        ),
        SizedBox(width: 10.w),
        ChoiceChip(
          label: const Text("Income"),
          labelStyle: TextStyle(
            color: selectedType == TransactionType.income
                ? theme.secondaryColor
                : theme.textPrimaryColor,
          ),
          checkmarkColor: theme.secondaryColor,
          selected: selectedType == TransactionType.income,
          selectedColor: theme.incomeColor,
          onSelected: (val) {
            onChanged(TransactionType.income);
          },
        ),
      ],
    );
  }
}

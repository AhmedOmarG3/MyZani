import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/colors.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text("Expense"),
          labelStyle: TextStyle(
            color: selectedType == TransactionType.expense
                ? kSecondryColor
                : Colors.black,
          ),
          checkmarkColor: kSecondryColor,
          selected: selectedType == TransactionType.expense,
          selectedColor: Colors.red,
          onSelected: (val) {
            onChanged(TransactionType.expense);
          },
        ),
        SizedBox(width: 10.w),
        ChoiceChip(
          label: const Text("Income"),
          labelStyle: TextStyle(
            color: selectedType == TransactionType.income
                ? kSecondryColor
                : Colors.black,
          ),
          checkmarkColor: kSecondryColor,
          selected: selectedType == TransactionType.income,
          selectedColor: const Color.fromARGB(255, 53, 125, 120),
          onSelected: (val) {
            onChanged(TransactionType.income);
          },
        ),
      ],
    );
  }
}

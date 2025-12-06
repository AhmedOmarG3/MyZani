import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/custom_common_app_bar.dart';
import 'package:myzani/core/widgets/more_dots_widget.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/add_transaction_body.dart';

class AddTransactionView extends StatelessWidget {
  const AddTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AddTransactionViewBody());
  }
}

enum TransactionType { expense, income }

class AddTransactionViewBody extends StatefulWidget {
  const AddTransactionViewBody({super.key});

  @override
  State<AddTransactionViewBody> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionViewBody> {
  TransactionType selectedType = TransactionType.income;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    Color mainColor = selectedType == TransactionType.expense
        ? theme.expenseColor
        : theme.incomeColor;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: Colors.transparent),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 1.sh * 0.35,
          child: CustomCommonAppBar(
            lastIcon: MoreDotsWidget(size: 35.sp),
            title: selectedType == TransactionType.expense
                ? 'Add Expense'
                : 'Add Income',
          ),
        ),
        Positioned(
          top: 180.h,
          left: 20.w,
          right: 20.w,
          child: AddTransactionBody(
            mainColor: mainColor,
            selectedType: selectedType,
            onTypeChanged: (type) {
              setState(() {
                selectedType = type;
              });
            },
          ),
        ),
      ],
    );
  }
}

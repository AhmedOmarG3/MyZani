import 'package:flutter/material.dart';
import 'package:myzani/features/insights/presentation/widgets/top_transactions_column.dart';
import 'package:myzani/features/insights/presentation/widgets/top_transactions_row.dart';

class TopTransactions extends StatelessWidget {
  const TopTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [TopTransactionsRow(), TopTransactionsColumn()]);
  }
}

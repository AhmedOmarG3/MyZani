import 'package:flutter/material.dart';
import 'package:myzani/features/insights/presentation/widgets/top_transaction_list_tile.dart';

class TopTransactionsColumn extends StatelessWidget {
  const TopTransactionsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TopTransactionListTile(),
        ),
      ),
    );
  }
}

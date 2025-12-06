import 'package:myzani/features/transactions_management/domain/entities/category_entity.dart';
import 'package:myzani/features/transactions_management/presentation/views/add_transaction_view.dart';

class TransactionEntity {
 
  final TransactionType type;
  final String title;
  final String description;
  final CategoryEntity category;
  final double amount;
  final DateTime date;

  TransactionEntity({ required this.type, required this.title, required this.description, required this.category, required this.amount, required this.date});
}
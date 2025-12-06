import 'package:hive_flutter/adapters.dart';
import 'package:myzani/features/transactions_management/data/models/category_model.dart';
import 'package:myzani/features/transactions_management/data/models/transaction_type_model.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/presentation/views/add_transaction_view.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 11)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final TransactionTypeModel type;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final CategoryModel category;

  @HiveField(4)
  final double amount;

  @HiveField(5)
  final DateTime date;

  TransactionModel({
    required this.type,
    required this.title,
    required this.description,
    required this.category,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      type: entity.type == TransactionType.income
          ? TransactionTypeModel.income
          : TransactionTypeModel.expense,
      title: entity.title,
      description: entity.description,
      category: CategoryModel.fromEntity(entity.category),
      amount: entity.amount,
      date: entity.date,
    );
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      type: type == TransactionTypeModel.income
          ? TransactionType.income
          : TransactionType.expense,
      title: title,
      description: description,
      category: category.toEntity(),
      amount: amount,
      date: date,
    );
  }
}

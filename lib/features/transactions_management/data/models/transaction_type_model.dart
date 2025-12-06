import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_type_model.g.dart';

@HiveType(typeId: 5)
enum TransactionTypeModel {
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}
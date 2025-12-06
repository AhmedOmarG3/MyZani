import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myzani/core/errors/failure.dart';
import 'package:myzani/features/home/domain/entities/home_card_entity.dart';
import 'package:myzani/features/transactions_management/data/models/transaction_model.dart';
import 'package:myzani/features/transactions_management/domain/entities/category_entity.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';
import 'package:myzani/features/transactions_management/presentation/views/add_transaction_view.dart';

class ManageTranasactionsRepoImpl extends ManageTranasactionsRepo {
  final transactionBox = Hive.box<TransactionModel>('transactions');
  @override
  Either<Failure, void> addTransaction({
    required TransactionEntity transactionEntity,
  }) {
    try {
      final model = TransactionModel.fromEntity(transactionEntity);

      transactionBox.add(model);

      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  List<TransactionEntity> getAllTransactions() {
    var transactions = transactionBox.values.map((e) => e.toEntity()).toList();
    return transactions;
  }

  @override
  TransactionEntity getOneTransaction({required int id}) {
    final model = transactionBox.get(id);
    return model!.toEntity();
  }

  @override
  Either<Failure, TransactionEntity> getLastTransaction() {
      if (transactionBox.values.isEmpty) {
    return Left(Failure(message: 'No transactions found'));
  }
  final model = transactionBox.values.last;
  return Right(model.toEntity());
}
  

  @override
  HomeCardEntity getTotalIncomeAndExpenses() {
    var totalIncome = 0.0;
    var totalExpenses = 0.0;
    if (transactionBox.values.isEmpty)
      return HomeCardEntity(
        totalIncome: totalIncome,
        totalBalance: 0.0,
        totalExpense: totalExpenses,
      );
    for (var transaction in transactionBox.values) {
      if (transaction.type.name == TransactionType.income.name) {
        totalIncome += transaction.amount;
      } else {
        totalExpenses += transaction.amount;
      }
    }
    double totalBalance = totalIncome - totalExpenses;

    return HomeCardEntity(
      totalIncome: totalIncome,
      totalExpense: totalExpenses,
      totalBalance: totalBalance,
    );
  }
}

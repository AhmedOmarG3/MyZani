import 'package:dartz/dartz.dart';
import 'package:myzani/core/errors/failure.dart';
import 'package:myzani/features/home/domain/entities/home_card_entity.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';

abstract class ManageTranasactionsRepo {
  Either<Failure, void> addTransaction({
    required TransactionEntity transactionEntity,
  });
   List<TransactionEntity> getAllTransactions();
   Either<Failure,TransactionEntity> getOneTransaction({required int id});
   Either<Failure, TransactionEntity> getLastTransaction();
   HomeCardEntity getTotalIncomeAndExpenses();
   void deleteTransaction({required int id});
   int getNextTransactionId();
   Either<Failure, void> updateTransaction({required TransactionEntity transactionEntity});
}

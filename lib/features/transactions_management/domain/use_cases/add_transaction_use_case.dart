import 'package:dartz/dartz.dart';
import 'package:myzani/core/errors/failure.dart';
import 'package:myzani/core/usecase/generic_use_case.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

class AddTransactionUseCase extends UseCase<void, TransactionEntity>{
  final ManageTranasactionsRepo manageTranasactionsRepo;

  AddTransactionUseCase({required this.manageTranasactionsRepo});
  @override
  Either<Failure, void> call(TransactionEntity entity) {
return manageTranasactionsRepo.addTransaction(transactionEntity: entity);
  }
}
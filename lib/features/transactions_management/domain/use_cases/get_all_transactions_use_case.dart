import 'package:myzani/core/usecase/generic_use_case.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

class GetAllTransactionsUseCase extends NoParamsUseCase<List<TransactionEntity>>{
  final ManageTranasactionsRepo manageTranasactionsRepo;

  GetAllTransactionsUseCase({required this.manageTranasactionsRepo});
  @override
   List<TransactionEntity> call() {
return manageTranasactionsRepo.getAllTransactions();
  }
}
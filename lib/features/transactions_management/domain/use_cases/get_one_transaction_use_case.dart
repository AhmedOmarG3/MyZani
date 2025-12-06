import 'package:myzani/core/usecase/generic_use_case.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

class GetOneTransactionUseCase extends ParamsUseCase<TransactionEntity,int>{
  final ManageTranasactionsRepo manageTranasactionsRepo;

  GetOneTransactionUseCase({required this.manageTranasactionsRepo});
  
  @override
  TransactionEntity call(int id) {
    return manageTranasactionsRepo.getOneTransaction(id: id);
  }


}
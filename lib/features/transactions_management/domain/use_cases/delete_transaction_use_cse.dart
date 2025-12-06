import 'package:myzani/core/usecase/generic_use_case.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

class DeleteTransactionUseCse extends ParamsUseCase<void ,int>{
final ManageTranasactionsRepo manageTranasactionsRepo;

  DeleteTransactionUseCse({required this.manageTranasactionsRepo});
  @override
  void call(int params) {
   return manageTranasactionsRepo.deleteTransaction(id: params);
  }
}
import 'package:myzani/core/usecase/generic_use_case.dart';
import 'package:myzani/features/home/domain/entities/home_card_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

class GetTotalIncomeAndExpensesUseCase extends NoParamsUseCase<HomeCardEntity> {
 final ManageTranasactionsRepo manageTranasactionsRepo;

  GetTotalIncomeAndExpensesUseCase({required this.manageTranasactionsRepo});
  @override
  HomeCardEntity call() {
    return manageTranasactionsRepo.getTotalIncomeAndExpenses();
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myzani/features/home/domain/entities/home_card_entity.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.manageTranasactionsRepo) : super(HomeInitial());
  final ManageTranasactionsRepo manageTranasactionsRepo;

Future<void> loadHomeData() async {
  emit(HomeIsEmpty());

  final transactions = manageTranasactionsRepo.getAllTransactions();
  final homeCardEntity = manageTranasactionsRepo.getTotalIncomeAndExpenses();

  emit(HomeDataLoaded(
    transactions: transactions,
    homeCardEntity: homeCardEntity,
  ));
}


  void changePage(int index) {
    if (state is HomeDataLoaded) {
      emit((state as HomeDataLoaded).copyWith(currentIndex: index));
    }
  }


}

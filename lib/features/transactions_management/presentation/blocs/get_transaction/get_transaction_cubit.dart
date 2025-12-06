import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

part 'get_transaction_state.dart';

class GetTransactionCubit extends Cubit<GetTransactionState> {
  GetTransactionCubit(this.manageTranasactionsRepo)
    : super(GetTransactionInitial());
  final ManageTranasactionsRepo manageTranasactionsRepo;

  Future<void> getTransaction(int id)async {
    emit(TransactionIsEmpty());
   var transactionEntity = manageTranasactionsRepo.getOneTransaction(id: id);
    emit(TransactionLoaded(transactionEntity: transactionEntity));
  }

    Future<void> getLastTransaction()async {
    emit(NoTransactionYetState());
   var transactionEntity = manageTranasactionsRepo.getLastTransaction();
    transactionEntity.fold((l) => emit(NoTransactionYetState()), (transactionEntity) => emit(TransactionLoaded(transactionEntity: transactionEntity)));
  }
}

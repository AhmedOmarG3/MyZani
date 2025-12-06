import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

part 'delete_transaction_state.dart';

class DeleteTransactionCubit extends Cubit<DeleteTransactionState> {
  DeleteTransactionCubit({required this.manageTranasactionsRepo}) : super(DeleteTransactionInitial());
final  ManageTranasactionsRepo manageTranasactionsRepo ;
  Future<void> deleteTransaction( {required int id}) async {
    emit(DeleteTransactionInitial());
    try {manageTranasactionsRepo.deleteTransaction(id: id);
    emit(DeleteTransactionSuccess());} 
     catch (e) {
       emit(DeleteTransactionError(message: e.toString()));
     }
     
    
  }

  
}

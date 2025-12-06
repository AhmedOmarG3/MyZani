import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit({required this.manageTranasactionsRepo})
    : super(AddTransactionInitial());

  final ManageTranasactionsRepo manageTranasactionsRepo;

  Future<void> addTransaction({
    required TransactionEntity transactionEntity,
  }) async {
    emit(AddTransactionLoading());
    final result = manageTranasactionsRepo.addTransaction(
      transactionEntity: transactionEntity,
    );

    result.fold(
      (failure) => emit(AddTransactionError(message: failure.message)),
      (_) => emit(AddTransactionSuccess()),
    );
  }

int autotransactionIdIncrement() {
  return manageTranasactionsRepo.getNextTransactionId();
}

Future<void> editTransaction({required TransactionEntity transactionEntity}) async {
  emit(AddTransactionLoading());

  final result = manageTranasactionsRepo.updateTransaction(transactionEntity: transactionEntity);

  result.fold(
    (failure) => emit(AddTransactionError(message: failure.message)),
    (_) => emit(AddTransactionSuccess()),
  );
}

}

part of 'get_transaction_cubit.dart';

@immutable
sealed class GetTransactionState {}

final class GetTransactionInitial extends GetTransactionState {}

final class TransactionIsEmpty extends GetTransactionState {}

final class NoTransactionYetState extends GetTransactionState {}
final class LastTransactionLoaded extends GetTransactionState {
  final TransactionEntity transactionEntity;
  LastTransactionLoaded({required this.transactionEntity});
}
final class TransactionLoaded extends GetTransactionState {
  final TransactionEntity transactionEntity;
  TransactionLoaded({required this.transactionEntity});
}




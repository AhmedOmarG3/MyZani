part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeIsEmpty extends HomeState {}
final class HomeDataLoaded extends HomeState {
  final List<TransactionEntity> transactions;
  final HomeCardEntity homeCardEntity;
  final int currentIndex;

  HomeDataLoaded({
    required this.transactions,
    required this.homeCardEntity,
    this.currentIndex = 0,
  });

  HomeDataLoaded copyWith({
    int? currentIndex,
    List<TransactionEntity>? transactions,
    HomeCardEntity? homeCardEntity,
  }) {
    return HomeDataLoaded(
      transactions: transactions ?? this.transactions,
      homeCardEntity: homeCardEntity ?? this.homeCardEntity,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}



import 'package:get_it/get_it.dart';
import 'package:myzani/features/transactions_management/data/repositories_impl/manage_tranasactions_repo_impl.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/add_transaction/add_transaction_cubit.dart';

final sl = GetIt.instance; // Service Locator instance

Future<void> initServiceLocator() async {
  // Repositories
  sl.registerLazySingleton<ManageTranasactionsRepo>(
      () => ManageTranasactionsRepoImpl());

  // Cubits
  sl.registerFactory(() => AddTransactionCubit(
        manageTranasactionsRepo: sl<ManageTranasactionsRepo>(),
      ));
}

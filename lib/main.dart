import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/core/service_locator.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/theme/theme_cubit.dart';
import 'package:myzani/features/home/presentation/blocs/home/home_cubit.dart';
import 'package:myzani/features/transactions_management/data/models/category_model.dart';
import 'package:myzani/features/transactions_management/data/models/transaction_model.dart';
import 'package:myzani/features/transactions_management/data/models/transaction_type_model.dart';
import 'package:myzani/features/transactions_management/domain/repositories/transactios_managment_repo.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/add_transaction/add_transaction_cubit.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/delete_transaction/delete_transaction_cubit.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/get_transaction/get_transaction_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(TransactionTypeModelAdapter());
  Hive.registerAdapter(TransactionModelAdapter());

  await Hive.openBox<CategoryModel>('categories');
  await Hive.openBox<TransactionModel>('transactions');
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = AppLightTheme();
    final darkTheme = AppDarkTheme();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(create: (_) => sl<AddTransactionCubit>()),
        BlocProvider(
          create: (context) =>
              HomeCubit(sl<ManageTranasactionsRepo>())..loadHomeData(),
        ),
        BlocProvider(
          create: (context) =>
              GetTransactionCubit(sl<ManageTranasactionsRepo>()),
        ),
        BlocProvider(
          create: (context) => DeleteTransactionCubit(
            manageTranasactionsRepo: sl<ManageTranasactionsRepo>(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(420, 890),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, settingsState) {
              return BlocConsumer<ThemeCubit, ThemeMode>(
                listener: (context, themeMode) {},
                builder: (context, themeMode) {
                  return MaterialApp.router(
                    localizationsDelegates: [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    locale: settingsState.locale,
                    supportedLocales: const [Locale('en'), Locale('ar')],
                    builder: (context, appChild) {
                      return Directionality(
                        textDirection: settingsState.direction,
                        child: appChild ?? const SizedBox.shrink(),
                      );
                    },
                    theme: ThemeData(
                      brightness: Brightness.light,
                      scaffoldBackgroundColor:
                          lightTheme.scaffoldBackgroundColor,
                      fontFamily: 'Inter',
                      colorScheme: ColorScheme.light(
                        primary: lightTheme.primaryColor,
                        secondary: lightTheme.secondaryColor,
                        surface: lightTheme.surfaceColor,
                        onPrimary: lightTheme.onPrimaryColor,
                        onSurface: lightTheme.textPrimaryColor,
                      ),
                    ),
                    darkTheme: ThemeData(
                      brightness: Brightness.dark,
                      scaffoldBackgroundColor:
                          darkTheme.scaffoldBackgroundColor,
                      fontFamily: 'Inter',
                      colorScheme: ColorScheme.dark(
                        primary: darkTheme.primaryColor,
                        secondary: darkTheme.secondaryColor,
                        surface: darkTheme.surfaceColor,
                        onPrimary: darkTheme.onPrimaryColor,
                        onSurface: darkTheme.textPrimaryColor,
                      ),
                    ),
                    themeMode: themeMode,
                    debugShowCheckedModeBanner: false,
                    routerConfig: AppRouter.router,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

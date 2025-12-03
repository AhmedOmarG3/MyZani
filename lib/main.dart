import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/theme/theme_cubit.dart';


void main() {
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

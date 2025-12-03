import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myzani/core/settings/settings_cubit.dart';

/// Simple in-app localization without relying on Flutter's l10n tooling yet
class AppLocalizations {
  final String languageCode;

  AppLocalizations(this.languageCode);

  static AppLocalizations of(BuildContext context) {
    final langCode =
        context.watch<SettingsCubit>().state.locale.languageCode;
    return AppLocalizations(langCode);
  }

  bool get isArabic => languageCode == 'ar';

  // Profile / Settings
  String get settingsTitle => isArabic ? 'الإعدادات' : 'Settings';

  String get darkModeTitle => isArabic ? 'الوضع الداكن' : 'Dark Mode';

  String get darkModeSubtitle =>
      isArabic ? 'التبديل بين الوضع الفاتح والداكن' : 'Switch between light and dark theme';

  String get languageTitle => isArabic ? 'اللغة' : 'Language';

  String get languageSubtitle =>
      isArabic ? 'اختر لغة التطبيق' : 'Choose app language';

  String get englishLabel => isArabic ? 'الإنجليزية' : 'English';

  String get arabicLabel => isArabic ? 'العربية' : 'Arabic';

  String get currencyTitle => isArabic ? 'العملة' : 'Currency';

  String get currencySubtitle =>
      isArabic ? 'التبديل بين الجنيه المصري والدولار' : 'Toggle between EGP and Dollar';

  String get egpLabel =>
      isArabic ? 'جنيه مصري (EGP)' : 'Egyptian Pound (EGP)';

  String get usdLabel =>
      isArabic ? 'دولار أمريكي (\$)' : 'US Dollar (\$)';
}



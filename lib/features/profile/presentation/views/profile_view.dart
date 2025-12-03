import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/localization/app_localizations.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/theme/theme_cubit.dart';
import 'package:myzani/core/widgets/custom_common_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = context.appTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCommonAppBar(
            title: strings.isArabic ? 'الملف الشخصي' : 'Profile',
            lastIcon: Icon(
              Icons.settings,
              size: 25.sp,
              color: theme.secondaryColor,
            ),
          ),
          ProfileBody(),
        ],
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = context.appTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            strings.settingsTitle,
            style: AppStyles.textStyle20SemiBold(context).copyWith(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            strings.isArabic 
              ? 'قم بتخصيص تجربتك' 
              : 'Customize your experience',
            style: AppStyles.textStyle14Regular(context).copyWith(
              fontSize: 14.sp,
              color: theme.profileTileSecondaryColor,
            ),
          ),
          SizedBox(height: 25.h),
          
          // Settings Container
          Container(
            decoration: BoxDecoration(
              color: theme.cardBackgroundColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.08),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ThemeSwitcherTile(theme: theme, strings: strings),
                Divider(height: 1, thickness: 0.5, indent: 80.w, endIndent: 20.w),
                LanguageSwitcherTile(theme: theme, strings: strings),
                Divider(height: 1, thickness: 0.5, indent: 80.w, endIndent: 20.w),
                CurrencySwitcherTile(theme: theme, strings: strings),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class ThemeSwitcherTile extends StatelessWidget {
  const ThemeSwitcherTile({
    super.key,
    required this.theme,
    required this.strings,
  });

  final AppTheme theme;
  final AppLocalizations strings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withOpacity(0.15),
                  theme.primaryColor.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              Icons.dark_mode_rounded,
              color: theme.primaryColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.darkModeTitle,
                  style: AppStyles.textStyle14Regular(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  strings.darkModeSubtitle,
                  style: AppStyles.textStyle15Medium(context).copyWith(
                    fontSize: 13.sp,
                    color: theme.profileTileSecondaryColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          
          // Switch
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  activeColor: theme.primaryColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LanguageSwitcherTile extends StatelessWidget {
  const LanguageSwitcherTile({
    super.key,
    required this.theme,
    required this.strings,
  });

  final AppTheme theme;
  final AppLocalizations strings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withOpacity(0.15),
                  theme.primaryColor.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              Icons.language_rounded,
              color: theme.primaryColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          
          // Title and Options
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.languageTitle,
                  style: AppStyles.textStyle14Regular(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, settings) {
                    final isArabic = settings.locale.languageCode == 'ar';
                    return Row(
                      children: [
                        Expanded(
                          child: _LanguageOption(
                            label: strings.englishLabel,
                            isSelected: !isArabic,
                            onTap: () => context.read<SettingsCubit>().setEnglish(),
                            theme: theme,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: _LanguageOption(
                            label: strings.arabicLabel,
                            isSelected: isArabic,
                            onTap: () => context.read<SettingsCubit>().setArabic(),
                            theme: theme,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurrencySwitcherTile extends StatelessWidget {
  const CurrencySwitcherTile({
    super.key,
    required this.theme,
    required this.strings,
  });

  final AppTheme theme;
  final AppLocalizations strings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withOpacity(0.15),
                  theme.primaryColor.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              Icons.payments_rounded,
              color: theme.primaryColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          
          // Title and Options
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.currencyTitle,
                  style: AppStyles.textStyle14Regular(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, settings) {
                    final isDollar = settings.currencySymbol == '\$';
                    return Row(
                      children: [
                        Expanded(
                          child: _CurrencyOption(
                            label: 'EGP',
                            symbol: 'ج.م',
                            isSelected: !isDollar,
                            onTap: () => context.read<SettingsCubit>().toggleCurrency(),
                            theme: theme,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: _CurrencyOption(
                            label: 'USD',
                            symbol: '\$',
                            isSelected: isDollar,
                            onTap: () => context.read<SettingsCubit>().toggleCurrency(),
                            theme: theme,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.theme,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.primaryColor.withOpacity(0.1)
              : theme.shadowColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected
                ? theme.primaryColor
                : theme.shadowColor.withOpacity(0.1),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 16.sp,
                  color: theme.primaryColor,
                ),
              ),
            Text(
              label,
              style: AppStyles.textStyle14Regular(context).copyWith(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? theme.primaryColor : theme.profileTileSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrencyOption extends StatelessWidget {
  const _CurrencyOption({
    required this.label,
    required this.symbol,
    required this.isSelected,
    required this.onTap,
    required this.theme,
  });

  final String label;
  final String symbol;
  final bool isSelected;
  final VoidCallback onTap;
  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.primaryColor.withOpacity(0.1)
              : theme.shadowColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected
                ? theme.primaryColor
                : theme.shadowColor.withOpacity(0.1),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              symbol,
              style: AppStyles.textStyle14Regular(context).copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? theme.primaryColor : theme.profileTileSecondaryColor,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: AppStyles.textStyle14Regular(context).copyWith(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? theme.primaryColor : theme.profileTileSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
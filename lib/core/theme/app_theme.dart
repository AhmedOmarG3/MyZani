import 'package:flutter/material.dart';
import 'package:myzani/core/colors.dart';

abstract class AppTheme {
  // Primary colors
  Color get primaryColor;
  Color get secondaryColor;
  Color get accentColor;

  // Background colors
  Color get backgroundColor;
  Color get scaffoldBackgroundColor;
  Color get cardBackgroundColor;
  Color get topTransactionsBackgroundColor;
  Color get surfaceColor;
  Color get listTileBackgroundColor;
  Color get inputFillColor;
  Color get incomeCardBackgroundColor;
  Color get cardPrimaryColor;

  // Text colors
  Color get textPrimaryColor;
  Color get textSecondaryColor;
  Color get onPrimaryColor;
  Color get profileTileSecondaryColor;

  // Grey colors
  Color get greyColor;
  Color get darkGreyColor;

  // Border colors
  Color get borderColor;
  Color get borderLightColor;

  // Status colors
  Color get expenseColor;
  Color get incomeColor;

  // Shadow colors
  Color get shadowColor;

  // Gradient colors
  List<Color> get appBarGradientColors;
  List<Color> get buttonGradientColors;
  List<Color> get expenseGradientColors;

  // Chart colors - Enhanced for dynamic control
  Color get chartColor;
  Color get chartTooltipColor;
  Color get chartBackgroundColor;
  Color get chartMonthLabelColor;
  Color get chartStatisticsTextColor;
  Color get chartGridLineColor;
  Color get chartAreaGradientStart;
  Color get chartAreaGradientEnd;

  // Other specific colors
  Color get descriptionBackgroundColor;
}

class AppLightTheme extends AppTheme {
  @override
  Color get primaryColor => const Color(0xFF1B5C58);

  @override
  Color get secondaryColor => const Color(0xffFFFFFF);

  @override
  Color get accentColor => const Color(0xff438883);

  @override
  Color get backgroundColor => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get cardBackgroundColor => const Color(0xffFBFBFB);

  @override
  Color get surfaceColor => const Color(0xffFAFAFA);

  @override
  Color get listTileBackgroundColor => const Color(0xffF0F6F5);

  @override
  Color get inputFillColor => const Color(0xffF7F8F9);

  @override
  Color get incomeCardBackgroundColor => const Color(0xffD0E5E4);

  @override
  Color get cardPrimaryColor => const Color(0xff2F7E79);

  @override
  Color get textPrimaryColor => Colors.black;

  @override
  Color get textSecondaryColor => const Color(0xff666666);

  @override
  Color get onPrimaryColor => Colors.white;

  @override
  Color get greyColor => const Color(0xff8391A1);

  @override
  Color get darkGreyColor => const Color(0xff6A707C);

  @override
  Color get borderColor => const Color(0xffE8ECF4);

  @override
  Color get borderLightColor => const Color(0xffDDDDDD);

  @override
  Color get expenseColor => Colors.red;

  @override
  Color get incomeColor => const Color.fromARGB(255, 53, 125, 120);

  @override
  Color get shadowColor => Colors.black.withOpacity(0.010);

  @override
  List<Color> get appBarGradientColors => [
    const Color(0xff2A7C76),
    const Color(0xff429690),
  ];

  @override
  List<Color> get buttonGradientColors => [
    const Color(0xff69AEA9),
    const Color(0xff3F8782),
  ];

  @override
  List<Color> get expenseGradientColors => [
    const Color(0xffFF6B6B),
    const Color(0xffC62828),
  ];

  @override
  Color get chartColor => const Color(0xff2f8f83);

  @override
  Color get chartTooltipColor => const Color(0xffEBF1F1);

  @override
  Color get chartBackgroundColor => Colors.transparent;

  @override
  Color get chartMonthLabelColor => const Color(0xff666666);

  @override
  Color get chartStatisticsTextColor => Colors.black;

  @override
  Color get chartGridLineColor => const Color(0xffE8ECF4);

  @override
  Color get chartAreaGradientStart => const Color(0xff2f8f83);

  @override
  Color get chartAreaGradientEnd => Colors.transparent;

  @override
  Color get descriptionBackgroundColor => const Color(0xff438883);

  @override
  Color get topTransactionsBackgroundColor => const Color(0xffFBFBFB);

  @override
  Color get profileTileSecondaryColor =>
      const Color.fromARGB(255, 107, 107, 107);
}

class AppDarkTheme extends AppTheme {
  @override
  Color get primaryColor => const Color(0xFF1B5C58); // نفس اللون الأساسي

  @override
  Color get secondaryColor => const Color(0xffFFFFFF); // خلفية داكنة

  @override
  Color get accentColor => const Color(0xff438883); // نفس الـaccent

  @override
  Color get backgroundColor => const Color(0xff121212);

  @override
  Color get scaffoldBackgroundColor => const Color(0xff121212);

  @override
  Color get cardBackgroundColor => const Color.fromARGB(255, 51, 51, 51);

  @override
  Color get surfaceColor => const Color(0xff1A1A1A);

  @override
  Color get listTileBackgroundColor => const Color(0xff1B1B1B);

  @override
  Color get inputFillColor => const Color(0xff222222); // Input داكن لكن واضح

  @override
  Color get incomeCardBackgroundColor =>
      const Color(0xffFFFFFF).withOpacity(0.5);

  @override
  Color get cardPrimaryColor => const Color(0xff2F7E79); // نفس اللون الأساسي للأزرار

  @override
  Color get textPrimaryColor => Colors.white; // كل الكلام أبيض

  @override
  Color get textSecondaryColor => const Color(0xffCCCCCC); // نص ثانوي فاتح

  @override
  Color get onPrimaryColor => Colors.white;

  @override
  Color get greyColor => const Color(0xff8391A1);

  @override
  Color get darkGreyColor => const Color(0xff6A707C);

  @override
  Color get borderColor => const Color(0xff2A2A2A);

  @override
  Color get borderLightColor => const Color(0xff3A3A3A);

  @override
  Color get expenseColor => Colors.redAccent;

  @override
  Color get incomeColor => const Color(0xff357D78);

  @override
  Color get shadowColor => Colors.transparent;

  @override
  List<Color> get appBarGradientColors => [
    const Color(0xff2A7C76),
    const Color(0xff429690),
  ];

  @override
  List<Color> get buttonGradientColors => [
    const Color(0xff69AEA9),
    const Color(0xff3F8782),
  ];

  @override
  List<Color> get expenseGradientColors => [
    const Color(0xffFF6B6B),
    const Color(0xffC62828),
  ];

  @override
  Color get chartColor => const Color(0xff3FE8D1); // Brighter teal for dark theme visibility

  @override
  Color get chartTooltipColor => const Color(0xff193231);

  @override
  Color get chartBackgroundColor => kPrimaryColor.withOpacity(0.1); // Light gray for month labels in dark theme

  @override
  Color get chartMonthLabelColor => const Color(0xffCCCCCC); // Light gray for readability

  @override
  Color get chartStatisticsTextColor => Colors.white; // White text for dark backgrounds

  @override
  Color get chartGridLineColor => const Color(0xff3A3A3A); // Subtle grid lines

  @override
  Color get chartAreaGradientStart => const Color(0xff3FE8D1); // Bright teal start

  @override
  Color get chartAreaGradientEnd => Colors.transparent;

  @override
  Color get descriptionBackgroundColor => const Color(0xff438883);

  @override
  Color get topTransactionsBackgroundColor => Colors.transparent;

  @override
  Color get profileTileSecondaryColor =>
      const Color.fromARGB(255, 107, 107, 107);
}

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark ? AppDarkTheme() : AppLightTheme();
  }
}

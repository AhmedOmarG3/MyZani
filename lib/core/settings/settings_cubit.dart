import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsState extends Equatable {
  final Locale locale;
  final TextDirection direction;
  final String currencySymbol; // '\$' or 'EGP'

  const SettingsState({
    required this.locale,
    required this.direction,
    required this.currencySymbol,
  });

  factory SettingsState.english() => const SettingsState(
        locale: Locale('en'),
        direction: TextDirection.ltr,
        currencySymbol: '\$',
      );

  SettingsState copyWith({
    Locale? locale,
    TextDirection? direction,
    String? currencySymbol,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      direction: direction ?? this.direction,
      currencySymbol: currencySymbol ?? this.currencySymbol,
    );
  }

  @override
  List<Object?> get props => [locale, direction, currencySymbol];
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.english());

  void setEnglish() {
    emit(
      state.copyWith(
        locale: const Locale('en'),
        direction: TextDirection.ltr,
      ),
    );
  }

  void setArabic() {
    emit(
      state.copyWith(
        locale: const Locale('ar'),
        direction: TextDirection.rtl,
      ),
    );
  }

  void toggleCurrency() {
    final newSymbol = state.currencySymbol == '\$' ? 'EGP' : '\$';
    emit(state.copyWith(currencySymbol: newSymbol));
  }
}



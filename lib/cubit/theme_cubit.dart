// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeMode _theme = ThemeMode.light;

  ThemeCubit() : super(LightThemeState());

  void toggleTheme() {
    if (_theme == ThemeMode.light) {
      _theme = ThemeMode.dark;
      emit(DarkThemeState());
    } else {
      _theme = ThemeMode.light;
      emit(LightThemeState());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_darkTheme);

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineMedium: TextStyle(color: Colors.black.withOpacity(0.7)),
      displaySmall: const TextStyle(color: Colors.black), // Adjust the style
    ),
    dividerColor: Colors.black,
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headlineMedium: TextStyle(color: Colors.white.withOpacity(0.7)),
      displaySmall: const TextStyle(color: Colors.white), // Adjust the style
    ),
    dividerColor: Colors.white,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}

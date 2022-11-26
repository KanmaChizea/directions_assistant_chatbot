import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void changeTheme(int value) {
    if (value == 1) {
      emit(ThemeMode.light);
    } else if (value == 2) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.system);
    }
  }
}

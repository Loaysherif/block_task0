import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    on<ToggleTheme>((event, emit) {
      emit(
        state.brightness == Brightness.dark
            ? ThemeData.light()
            : ThemeData.dark(),
      );
    });
  }
}

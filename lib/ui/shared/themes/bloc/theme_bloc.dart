import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games_app/ui/shared/themes/themes.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeBloc() : super(const ThemeState.light()) {
    on<ChangeTheme>(_onChangeTheme);
  }

  void _onChangeTheme(
    ChangeTheme event, 
    Emitter<ThemeState> emit
  ) {
    switch (event.theme) {
      case ThemeApp.dark: 
        _isDarkMode = true;
        emit(const ThemeState.dark());
        break;
      case ThemeApp.light:
        _isDarkMode = false;
        emit(const ThemeState.light());
        break;
      default: emit(const ThemeState.light());
    }
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    if (json['isDark'] as bool) return const ThemeState.dark();
    return const ThemeState.light();
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'isDark': state == const ThemeState.dark()};
  }
}

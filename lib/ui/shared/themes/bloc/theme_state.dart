part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.light() = LightTheme;
  const factory ThemeState.dark() = DarkTheme;
}

part of 'games_bloc.dart';

@freezed
class GamesState with _$GamesState {
  const factory GamesState.loading() = _Loading;
  const factory GamesState.success() = _Success;
  const factory GamesState.failed() = _Failed;
}

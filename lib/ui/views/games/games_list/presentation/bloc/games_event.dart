part of 'games_bloc.dart';

@freezed
class GamesEvent with _$GamesEvent {
  const factory GamesEvent.getGamesList() = _GetGamesList;
  const factory GamesEvent.searchGame(String key) = _SearchGame;
  const factory GamesEvent.addCategoryFilter(
    String category
  ) = _AddCategoryFilter;
  const factory GamesEvent.changeOrder(String order) = _ChangeOrder;
}
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games_app/ui/views/games/games_list/data/models/game_model.dart';
import 'package:games_app/ui/views/games/games_list/domain/repositories/games_repository.dart';

part 'games_event.dart';
part 'games_state.dart';
part 'games_bloc.freezed.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GamesRepository repository;

  List<GameModel> allGames = [];
  List<GameModel> gamesList = [];

  List<String> categoriesSelected = [];
  String orderSelected = '';

  GamesBloc({
    required this.repository
  }) : super(const GamesState.loading()) {
    on<_GetGamesList>(onGetGamesList);
    on<_SearchGame>(onSearchGame);
    on<_AddCategoryFilter>(onAddCategoryFilter);
    on<_ChangeOrder>(onChangeOrder);
  }

  void onGetGamesList(
    _GetGamesList event,
    Emitter emit
  ) async {
    emit(const GamesState.loading());
    final either = await repository.getAllGames();
    either.fold(
      (failure) => emit(const GamesState.failed()),
      (response) {
        allGames = response;
        gamesList = allGames;
        emit(const GamesState.success());
      }
    );
  }

  void onSearchGame(
    _SearchGame event,
    Emitter emit
  ) async {
    emit(const GamesState.loading());
    if (event.key.isEmpty) {
      gamesList = allGames;
    } else {
      gamesList = allGames.where(
        (p) => p.title
            .toLowerCase()
            .contains(event.key.toLowerCase())
      ).toList();
    }
    emit(const GamesState.success());
  }

  void onAddCategoryFilter(
    _AddCategoryFilter event,
    Emitter emit
  ) async {
    emit(const GamesState.loading());
    if (categoriesSelected.contains(event.category)) {
      categoriesSelected.removeWhere(
        (e) => e == event.category
      );
      if (categoriesSelected.isNotEmpty) {
        gamesList.removeWhere(
          (e) => e.genre.toLowerCase() == event.category
        );
        return emit(const GamesState.success());
      }
      gamesList = allGames;
      return emit(const GamesState.success());
    }
    categoriesSelected.add(event.category);
    final filteredList = allGames.where(
      (e) => categoriesSelected.contains(e.genre.toLowerCase())
    ).toList();
    gamesList = filteredList;
    emit(const GamesState.success());
  }

  void onChangeOrder(
    _ChangeOrder event,
    Emitter emit
  ) async {
    emit(const GamesState.loading());
    if (orderSelected == event.order) {
      orderSelected = '';
      gamesList = allGames;
      return emit(const GamesState.success());
    }
    orderSelected = event.order;
    switch (orderSelected) {
      case 'A - Z':
        gamesList.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Z - A':
        gamesList.sort((a, b) => b.title.compareTo(a.title));
        break;
      default:
        gamesList = allGames;
    }
    emit(const GamesState.success());
  }
}

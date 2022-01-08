import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games_app/core/error/failures.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:games_app/ui/views/games/game_detail/domain/repositories/games_detail_repository.dart';

part 'game_detail_event.dart';
part 'game_detail_state.dart';
part 'game_detail_bloc.freezed.dart';

class GameDetailBloc extends Bloc<GameDetailEvent, GameDetailState> {
  final GamesDetailRepository repository;

  GameDetailModel gameDetail = GameDetailModel.empty();

  GameDetailBloc({
    required this.repository
  }) : super(const GameDetailState.loading()) {
    on<GetGameById>(onGetGameById);
  }

  void onGetGameById(
    GetGameById event,
    Emitter emit
  ) async {
    emit(const GameDetailState.loading());
    debugPrint('gameId =======> ${event.id}');
    final either = await repository.getGameById(event.id);
    either.fold(
      (failure) {
        switch (failure.runtimeType) {
          case ServerFailure:
            emit(const GameDetailState.failed());
            return;
          case ElementNotFoundFailure:
            emit(const GameDetailState.notFound());
            return;
          default:
            emit(const GameDetailState.failed());
            return;
        }
      },
      (response) {
        gameDetail = response;
        emit(const GameDetailState.success());
      }
    );
  }
}

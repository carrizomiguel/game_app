part of 'game_detail_bloc.dart';

@freezed
class GameDetailState with _$GameDetailState {
  const factory GameDetailState.loading() = _Loading;
  const factory GameDetailState.success() = _Success;
  const factory GameDetailState.failed() = _Failed;
  const factory GameDetailState.notFound() = _NotFound;
}

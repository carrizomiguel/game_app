import 'package:dartz/dartz.dart';
import 'package:games_app/core/error/failures.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';

abstract class GamesDetailRepository {
  Future<Either<Failure, GameDetailModel>> getGameById(int id);
}
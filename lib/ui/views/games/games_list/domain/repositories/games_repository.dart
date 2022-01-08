import 'package:dartz/dartz.dart';
import 'package:games_app/core/error/failures.dart';
import 'package:games_app/ui/views/games/games_list/data/models/game_model.dart';

abstract class GamesRepository {
  Future<Either<Failure, List<GameModel>>> getAllGames();
}
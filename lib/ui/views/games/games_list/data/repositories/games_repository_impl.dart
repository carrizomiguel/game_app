import 'package:games_app/core/error/exceptions.dart';
import 'package:games_app/core/network/network_info.dart';
import 'package:games_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:games_app/ui/views/games/games_list/data/datasources/games_local_data_source.dart';
import 'package:games_app/ui/views/games/games_list/data/datasources/games_remote_data_source.dart';
import 'package:games_app/ui/views/games/games_list/data/models/game_model.dart';
import 'package:games_app/ui/views/games/games_list/domain/repositories/games_repository.dart';

class GamesRepositoryImpl implements GamesRepository {
  final GamesLocalDataSource localDataSource;
  final GamesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GamesRepositoryImpl({
    required this.localDataSource, 
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<GameModel>>> getAllGames() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.getGamesList();
        localDataSource.cacheGamesList(remote);
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await localDataSource.getLastGamesList();
        return Right(local);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
import 'package:games_app/core/error/exceptions.dart';
import 'package:games_app/core/network/network_info.dart';
import 'package:games_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:games_app/ui/views/games/game_detail/data/datasources/game_detail_local_data_source.dart';
import 'package:games_app/ui/views/games/game_detail/data/datasources/game_detail_remote_data_source.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:games_app/ui/views/games/game_detail/domain/repositories/games_detail_repository.dart';

class GameDetailRepositoryImpl implements GamesDetailRepository {
  final GameDetailLocalDataSource localDataSource;
  final GameDetailRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GameDetailRepositoryImpl({
    required this.localDataSource, 
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, GameDetailModel>> getGameById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.getGameById(id);
        localDataSource.cacheGameDetail(remote);
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await localDataSource.getLastGameDetailById(id);
        return Right(local);
      } on ElementNotFoundException {
        return Left(ElementNotFoundFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
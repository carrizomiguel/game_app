import 'package:games_app/core/error/exceptions.dart';
import 'package:games_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:games_app/ui/views/auth/guest/data/datasources/guest_local_data_source.dart';
import 'package:games_app/ui/views/auth/guest/domain/repositories/guest_repository.dart';

class GuestRepositoryImpl implements GuestRepository {
  final GuestLocalDataSource localDataSource;

  GuestRepositoryImpl({
    required this.localDataSource
  });

  @override
  Future<Either<Failure, String>> saveGuestInfo(String user) async {
    try {
      localDataSource.cacheGuestInfo(user);
      return const Right('We can start now!');
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
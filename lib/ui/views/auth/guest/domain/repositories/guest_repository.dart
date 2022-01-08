import 'package:dartz/dartz.dart';
import 'package:games_app/core/error/failures.dart';

abstract class GuestRepository {
  Future<Either<Failure, String>> saveGuestInfo(String user);
}
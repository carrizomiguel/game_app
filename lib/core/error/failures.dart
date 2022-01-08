import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

class CacheFailure extends Failure {}

class ElementNotFoundFailure extends Failure {}
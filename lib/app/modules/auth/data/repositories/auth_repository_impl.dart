import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/logged_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, LoggedUser>> getLoggedUser() async {
    try {
      final user = await authDataSource.getLoggedUser();
      return Right(user);
    } on LoggedUserException {
      return Left(LoggedUserFailure());
    }
  }

  @override
  Future<Either<Failure, LoggedUser>> loginWithGoogle() async {
    try {
      final user = await authDataSource.loginWithGoogle();
      return Right(user);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await authDataSource.loginWithGoogle();
      return const Right(unit);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}

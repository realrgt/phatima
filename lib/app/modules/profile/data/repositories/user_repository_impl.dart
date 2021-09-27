import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserDataSource _userDataSource;

  UserRepositoryImpl({required IUserDataSource userDataSource})
      : _userDataSource = userDataSource;

  @override
  Future<Either<Failure, User>> getUser(String uid) async {
    try {
      final user = await _userDataSource.getUser(uid);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser(User user) async {
    try {
      await _userDataSource.updateUser(user as UserModel);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

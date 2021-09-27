import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class IUserRepository {
  Future<Either<Failure, User>> getUser(String uid);
  Future<Either<Failure, Unit>> updateUser(User user);
}

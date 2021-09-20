import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/logged_user.dart';

abstract class IAuthRepository {
  Future<Either<Failure, LoggedUser>> loginWithGoogle();
  Future<Either<Failure, LoggedUser>> getLoggedUser();
  Future<Either<Failure, Unit>> logout();
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/logged_user.dart';

abstract class IAuthRepository {
  Future<Either<Failure, LoggedUser>> login();
  Future<Either<Failure, LoggedUser>> logout();
  Either<Failure, LoggedUser> getLoggedUser();
}

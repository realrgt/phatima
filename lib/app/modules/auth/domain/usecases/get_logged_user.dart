import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/no_params.dart';
import '../entities/logged_user.dart';
import '../repositories/auth_repository.dart';

class GetLoggedUser implements IUsecase<LoggedUser, NoParams> {
  final IAuthRepository authRepository;
  GetLoggedUser({required this.authRepository});

  @override
  Future<Either<Failure, LoggedUser>> call(NoParams params) async {
    return await authRepository.getLoggedUser();
  }
}

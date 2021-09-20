import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/no_params.dart';
import '../entities/logged_user.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogle implements IUsecase<LoggedUser, NoParams> {
  final IAuthRepository authRepository;
  LoginWithGoogle({required this.authRepository});

  @override
  Future<Either<Failure, LoggedUser>> call(NoParams params) async {
    return await authRepository.loginWithGoogle();
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/params.dart';
import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecase/usecase.dart';
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

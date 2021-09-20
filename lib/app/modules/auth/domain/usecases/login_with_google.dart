import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
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

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

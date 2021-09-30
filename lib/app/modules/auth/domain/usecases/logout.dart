import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/params.dart';
import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class Logout implements IUsecase<Unit, NoParams> {
  final IAuthRepository authRepository;
  Logout({required this.authRepository});

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await authRepository.logout();
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/no_params.dart';
import '../repositories/auth_repository.dart';

class Logout implements IUsecase<Unit, NoParams> {
  final IAuthRepository authRepository;
  Logout({required this.authRepository});

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await authRepository.logout();
  }
}

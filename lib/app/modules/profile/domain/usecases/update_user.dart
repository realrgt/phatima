import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UpdateUser implements IUsecase<Unit, UserUpdateParams> {
  final IUserRepository _userRepository;

  UpdateUser({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, Unit>> call(UserUpdateParams params) async {
    return await _userRepository.updateUser(params.user);
  }
}

class UserUpdateParams {
  final User user;
  UserUpdateParams({required this.user});
}

import 'package:dartz/dartz.dart';
import 'package:phatima/app/modules/profile/domain/entities/user.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
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

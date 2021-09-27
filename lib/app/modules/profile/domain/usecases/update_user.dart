import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class UpateUser implements IUsecase<Unit, UserUpdateParams> {
  final IUserRepository _userRepository;

  UpateUser({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, Unit>> call(UserUpdateParams params) async {
    return await _userRepository.updateUser(params.uid);
  }
}

class UserUpdateParams {
  final String uid;
  UserUpdateParams({required this.uid});
}

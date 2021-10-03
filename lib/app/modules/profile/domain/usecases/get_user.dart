import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUser implements IUsecase<User, UserGetParams> {
  final IUserRepository _userRepository;

  GetUser({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, User>> call(UserGetParams params) async {
    return await _userRepository.getUser(params.uid);
  }
}

class UserGetParams {
  final String uid;
  UserGetParams({required this.uid});
}

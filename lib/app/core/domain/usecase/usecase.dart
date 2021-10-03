import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class IUsecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

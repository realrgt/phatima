import 'package:dartz/dartz.dart';
import 'package:phatima/app/core/error/failures.dart';

abstract class IUsecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

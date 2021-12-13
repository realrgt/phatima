import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';

abstract class IWalletRepository {
  Future<Either<Failure, double>> getAccountBallance(String uid);
  Future<Either<Failure, Unit>> rechargeAccount(
    String uid,
    double value,
    String phone,
  );
}

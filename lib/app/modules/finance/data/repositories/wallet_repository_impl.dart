import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../datasources/wallet_datasource.dart';
import '../drivers/payment_gateway.dart';

class WalletRepositoryImpl implements IWalletRepository {
  final IWalletDataSource _walletDataSource;
  final IPaymentGateway _paymentGateway;

  WalletRepositoryImpl({
    required IWalletDataSource walletDataSource,
    required IPaymentGateway paymentGateway,
  })  : _walletDataSource = walletDataSource,
        _paymentGateway = paymentGateway;

  @override
  Future<Either<Failure, double>> getAccountBallance(String uid) async {
    try {
      final accountBallance = await _walletDataSource.getAccountBallance(uid);

      return Right(accountBallance);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> rechargeAccount(
    String uid,
    double value,
    String phone,
  ) async {
    bool isPaymentDone = await _paymentGateway.performC2BPayment(value, phone);

    if (isPaymentDone) {
      try {
        await _walletDataSource.rechargeAccount(uid, value);

        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(PaymentFailure());
    }
  }
}

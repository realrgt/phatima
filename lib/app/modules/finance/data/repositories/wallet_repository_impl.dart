import 'package:dartz/dartz.dart';
import 'package:phatima/app/modules/finance/data/drivers/payment_gateway.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../datasources/wallet_datasource.dart';

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
  ) async {
    const phone = "258847522988";
    if (await _paymentGateway.performC2BPayment(value, phone)) {
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

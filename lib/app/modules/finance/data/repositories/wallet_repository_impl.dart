import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../datasources/wallet_datasource.dart';

class WalletRepositoryImpl implements IWalletRepository {
  final IWalletDataSource _walletDataSource;

  WalletRepositoryImpl({
    required IWalletDataSource walletDataSource,
  }) : _walletDataSource = walletDataSource;

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
    try {
      await _walletDataSource.rechargeAccount(uid, value);

      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

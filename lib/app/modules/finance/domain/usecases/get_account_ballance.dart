import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../repositories/wallet_repository.dart';

class GetAccountBallance implements IUsecase<double, BallanceParams> {
  final IWalletRepository _walletRepository;

  GetAccountBallance({
    required IWalletRepository walletRepository,
  }) : _walletRepository = walletRepository;

  @override
  Future<Either<Failure, double>> call(BallanceParams params) async {
    return await _walletRepository.getAccountBallance(params.uid);
  }
}

class BallanceParams {
  final String uid;
  BallanceParams({required this.uid});
}

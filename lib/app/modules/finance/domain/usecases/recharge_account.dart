import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../repositories/wallet_repository.dart';

class RechargeAccount implements IUsecase<Unit, RechargeParams> {
  final IWalletRepository _walletRepository;

  RechargeAccount({
    required IWalletRepository walletRepository,
  }) : _walletRepository = walletRepository;

  @override
  Future<Either<Failure, Unit>> call(RechargeParams params) async {
    return await _walletRepository.rechargeAccount(params.uid, params.value);
  }
}

class RechargeParams {
  final String uid;
  final double value;

  RechargeParams({required this.uid, required this.value});
}

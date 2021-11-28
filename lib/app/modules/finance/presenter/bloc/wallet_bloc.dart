import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../../core/domain/util/constants/messages.dart';
import '../../../../core/presenter/blocs/bloc_base.dart';
import '../../domain/usecases/get_account_ballance.dart';
import '../../domain/usecases/recharge_account.dart';
import 'bloc.dart';

class WalletBloc implements BloC<WalletEvent, WalletState> {
  final GetAccountBallance _getAccountBallance;
  final RechargeAccount _rechargeAccount;

  final _subject = BehaviorSubject<WalletEvent>();
  StreamSink<WalletEvent> get sink => _subject.sink;
  Stream<WalletState> get stream => _subject.switchMap(mapEventToState);

  WalletBloc({
    required GetAccountBallance getAccountBallance,
    required RechargeAccount rechargeAccount,
  })  : _getAccountBallance = getAccountBallance,
        _rechargeAccount = rechargeAccount;

  @override
  Stream<WalletState> mapEventToState(WalletEvent event) async* {
    if (event is SeeMoney) {
      yield* _mapSeeMoneyToState(event);
    } else if (event is PlaceMoney) {
      yield* _mapPlaceMoneyToState(event);
    }
  }

  Stream<WalletState> _mapSeeMoneyToState(WalletEvent event) async* {
    yield WalletInitial();
    yield WalletLoading();
    final failureOrBallance =
        await _getAccountBallance(BallanceParams(uid: event.uid));
    yield failureOrBallance.fold(
      (failure) => const WalletError(message: ballanceLoadErrorMessage),
      (balance) => WalletLoaded(value: balance),
    );
  }

  Stream<WalletState> _mapPlaceMoneyToState(WalletEvent event) async* {
    yield WalletInitial();
    yield WalletLoading();
    final failureOrUnit = await _rechargeAccount(
        RechargeParams(uid: event.uid, value: event.value!));
    yield failureOrUnit.fold(
      (failure) => const WalletError(message: ballanceUpadateErrorMessage),
      (unit) => WalletLoaded(value: event.value!),
    );
  }

  @override
  void dispose() {
    _subject.close();
  }
}

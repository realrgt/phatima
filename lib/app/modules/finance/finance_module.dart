import 'package:flutter_modular/flutter_modular.dart';
import 'package:phatima/app/core/data/util/phone_number_format.dart';
import 'package:phatima/app/modules/finance/data/drivers/payment_gateway.dart';
import 'package:phatima/app/modules/finance/data/drivers/payment_gateway_impl.dart';

import '../../core/domain/usecase/usecase.dart';
import '../../core/presenter/blocs/bloc_base.dart';
import 'data/datasources/wallet_datasource.dart';
import 'data/datasources/wallet_datasource_firestore_impl.dart';
import 'data/repositories/wallet_repository_impl.dart';
import 'domain/repositories/wallet_repository.dart';
import 'domain/usecases/get_account_ballance.dart';
import 'domain/usecases/recharge_account.dart';
import 'presenter/bloc/bloc.dart';
import 'presenter/pages/finance_page.dart';

class FinanceModule extends Module {
  @override
  final List<Bind> binds = [
    //* bloc
    Bind.lazySingleton<BloC>(
      (i) => WalletBloc(getAccountBallance: i(), rechargeAccount: i()),
    ),
    //* usecases
    Bind.lazySingleton<IUsecase>(
      (i) => GetAccountBallance(walletRepository: i()),
    ),
    Bind.lazySingleton<IUsecase>(
      (i) => RechargeAccount(walletRepository: i()),
    ),
    //* repositories
    Bind.lazySingleton<IWalletRepository>(
      (i) => WalletRepositoryImpl(walletDataSource: i(), paymentGateway: i()),
    ),
    //* datasources
    Bind.lazySingleton<IWalletDataSource>(
      (i) => WalletDataSourceFirestoreImpl(firestore: i()),
    ),
    //* drivers
    Bind.lazySingleton<IPaymentGateway>(
        (i) => PaymentGatewayImpl(phoneNumberFormat: i())),
    //* util
    Bind.lazySingleton<IPhoneNumberFormat>((i) => PhoneNumberFormatImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const FinancePage()),
  ];
}

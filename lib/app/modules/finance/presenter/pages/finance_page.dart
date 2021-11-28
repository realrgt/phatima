import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/util/constants/firebase.dart';
import '../../../../core/presenter/widgets/widgets.dart';
import '../bloc/bloc.dart';
import '../widgets/wallet_display_widget.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  final walletBloc = Modular.get<WalletBloc>();

  @override
  void initState() {
    walletBloc.sink.add(SeeMoney(uid: userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WalletState>(
      stream: walletBloc.stream,
      initialData: WalletInitial(),
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is WalletLoading) {
          return const LoadingWidget();
        } else if (state is WalletLoaded) {
          return WalletDisplay(accountBallance: state.value!);
        } else if (state is WalletError) {
          return Center(child: Text(state.errorMsg!));
        }
        return const Center(child: Text('Unnexpected Error'));
      },
    );
  }
}

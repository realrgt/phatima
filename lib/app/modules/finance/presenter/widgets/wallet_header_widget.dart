import 'package:flutter/material.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({Key? key, required this.accountBallance})
      : super(key: key);

  final double accountBallance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30.0),
        Text(
          'Wallet',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 90.0),
        Text(
          'Saldo $accountBallance MZN',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

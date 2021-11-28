import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/util/constants/firebase.dart';
import '../../../../core/presenter/widgets/widgets.dart';
import '../bloc/bloc.dart';

// ignore: must_be_immutable
class WalletSection extends StatelessWidget {
  WalletSection({Key? key, required this.phone}) : super(key: key);

  final String phone;

  final _walletBloc = Modular.get<WalletBloc>();
  late double _amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              _walletBloc.sink.add(PlaceMoney(uid: userId, value: _amount));
            },
            icon: Icon(
              Icons.send_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Mpesa: $phone',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 12),
        CustomTextField(
          keyboardType: TextInputType.number,
          hintText: 'Valor',
          prefixIcon: const Icon(Icons.attach_money),
          onChanged: (value) => _amount = double.parse(value),
        ),
      ],
    );
  }
}

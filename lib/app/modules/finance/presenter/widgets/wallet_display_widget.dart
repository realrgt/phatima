import 'package:flutter/material.dart';

import '../../../../core/domain/util/configurations/base_configs.dart';
import '../../../../core/presenter/widgets/app_scaffold_widget.dart';
import 'wallet_header_widget.dart';
import 'wallet_section_widget.dart';

class WalletDisplay extends StatelessWidget {
  const WalletDisplay({Key? key, required this.accountBallance})
      : super(key: key);
  final double accountBallance;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      headerHeight: appHeight / 2.2,
      headerContent: WalletHeader(accountBallance: accountBallance),
      sectionContent: WalletSection(phone: '+258 84 752 2988'),
      sectionHeight: appHeight / 2,
    );
  }
}

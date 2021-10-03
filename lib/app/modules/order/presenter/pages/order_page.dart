import 'package:flutter/material.dart';

import '../../../../core/domain/util/configurations/base_configs.dart';
import '../../../../core/presenter/widgets/app_scaffold_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      headerHeight: appHeight / 2.2,
      sectionHeight: appHeight / 2,
      sectionContent: const Center(
        child: Text('Order'),
      ),
    );
  }
}

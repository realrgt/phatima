import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/finance_page.dart';

class FinanceModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const FinancePage()),
  ];
}

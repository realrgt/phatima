import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const Scaffold()),
  ];
}

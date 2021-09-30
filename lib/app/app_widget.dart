import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/domain/util/global_scaffold.dart';
import 'core/presenter/blocs/auth/bloc.dart';
import 'core/presenter/pages/splash_screen_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _authBloc = Modular.get<AuthBloc>();

  @override
  void initState() {
    _authBloc.sink.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: _authBloc.stream,
      initialData: Uninitialized(),
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is Uninitialized) {
          return const SplashScreenPage();
        }

        return MaterialApp(
          scaffoldMessengerKey: GlobalScaffold.instance.scaffoldMessengerKey,
          title: 'Flutter Slidy',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: state is Authenticated ? 'home/' : 'auth/',
        ).modular();
      },
    );
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }
}

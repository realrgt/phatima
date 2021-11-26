import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/domain/util/global_scaffold.dart';
import 'core/presenter/blocs/auth/bloc.dart';
import 'core/presenter/blocs/theme/bloc.dart';
import 'core/presenter/pages/splash_screen_page.dart';
import 'core/presenter/theme/app_themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _authBloc = Modular.get<AuthBloc>();
  final _themeBloc = Modular.get<ThemeBloc>();

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
        final authState = snapshot.data;

        if (authState is Uninitialized) return const SplashScreenPage();

        return StreamBuilder<ThemeState>(
          initialData: ThemeState(themeData: appThemeData[AppTheme.light]!),
          stream: _themeBloc.state,
          builder: (context, themeSnapshot) {
            return renderMain(authState, themeSnapshot);
          },
        );
      },
    );
  }

  MaterialApp renderMain(AuthState? authState, AsyncSnapshot themeSnapshot) {
    return MaterialApp(
      scaffoldMessengerKey: GlobalScaffold.instance.scaffoldMessengerKey,
      title: 'Flutter Slidy',
      debugShowCheckedModeBanner: false,
      theme: themeSnapshot.data.themeData,
      initialRoute: authState is Authenticated ? 'home/' : 'auth/',
    ).modular();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }
}

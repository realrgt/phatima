import 'package:flutter_modular/flutter_modular.dart';

import '../../core/usecase/usecase.dart';
import 'domain/usecases/login_with_google.dart';
import 'presenter/bloc/login_bloc.dart';
import 'presenter/pages/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // * blocs
    Bind.lazySingleton((i) => LoginBloc(i(), i(), i())),
    // * usecases
    Bind.lazySingleton<IUsecase>((i) => LoginWithGoogle(authRepository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}

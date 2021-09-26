import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/blocs/auth/auth_bloc.dart';
import 'core/usecase/usecase.dart';
import 'core/util/presenter/widgets/page_toggler_widget.dart';
import 'modules/auth/auth_module.dart';
import 'modules/auth/data/datasources/auth_datasource.dart';
import 'modules/auth/data/datasources/auth_firebase_impl.dart';
import 'modules/auth/data/repositories/auth_repository_impl.dart';
import 'modules/auth/domain/repositories/auth_repository.dart';
import 'modules/auth/domain/usecases/get_logged_user.dart';
import 'modules/auth/domain/usecases/logout.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //* bloc
    Bind.singleton((i) => AuthBloc(i(), i())),
    //* use cases
    Bind.lazySingleton<IUsecase>((i) => GetLoggedUser(authRepository: i())),
    Bind.lazySingleton<IUsecase>((i) => Logout(authRepository: i())),
    //* repositories
    Bind.lazySingleton<IAuthRepository>(
        (i) => AuthRepositoryImpl(authDataSource: i())),
    //* datasources
    Bind.lazySingleton<IAuthDataSource>(
        (i) => AuthFirebaseImpl(firebaseAuth: i())),
    //! external
    Bind.singleton((i) => FirebaseAuth.instance),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const PageToggle(),
      children: [
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
      ],
    )
  ];
}

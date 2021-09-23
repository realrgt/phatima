import 'package:flutter_modular/flutter_modular.dart';

import '../../core/usecase/usecase.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/datasources/auth_firebase_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/login_with_google.dart';
import 'domain/usecases/logout.dart';
import 'presenter/bloc/login_bloc.dart';
import 'presenter/pages/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    //* bloc
    Bind.lazySingleton((i) => LoginBloc(i(), i(), i())),
    //* use cases
    Bind.lazySingleton<IUsecase>((i) => LoginWithGoogle(authRepository: i())),
    Bind.lazySingleton<IUsecase>((i) => GetLoggedUser(authRepository: i())),
    Bind.lazySingleton<IUsecase>((i) => Logout(authRepository: i())),
    //* repositories
    Bind.lazySingleton<IAuthRepository>(
        (i) => AuthRepositoryImpl(authDataSource: i())),
    //* datasources
    Bind.lazySingleton<IAuthDataSource>(
        (i) => AuthFirebaseImpl(firebaseAuth: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}

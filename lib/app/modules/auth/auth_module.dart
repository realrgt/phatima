import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phatima/app/core/usecase/usecase.dart';
import 'package:phatima/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:phatima/app/modules/auth/data/datasources/auth_firebase_impl.dart';
import 'package:phatima/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:phatima/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:phatima/app/modules/auth/domain/usecases/get_logged_user.dart';
import 'package:phatima/app/modules/auth/domain/usecases/login_with_google.dart';
import 'package:phatima/app/modules/auth/domain/usecases/logout.dart';
import 'package:phatima/app/modules/auth/presenter/bloc/login_bloc.dart';

class HomeModule extends Module {
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
    ChildRoute(Modular.initialRoute, child: (_, args) => const Scaffold()),
  ];
}

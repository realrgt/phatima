import 'package:flutter_modular/flutter_modular.dart';

import '../../core/domain/usecase/usecase.dart';
import '../../core/presenter/blocs/bloc_base.dart';
import 'data/datasources/user_datasource.dart';
import 'data/datasources/user_firestore_datasource_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user.dart';
import 'domain/usecases/update_user.dart';
import 'presenter/bloc/bloc.dart';
import 'presenter/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    //* blocs
    Bind.lazySingleton<BloC>((i) => ProfileBloc(getUser: i(), upateUser: i())),
    //* usecases
    Bind.lazySingleton<IUsecase>((i) => GetUser(userRepository: i())),
    Bind.lazySingleton<IUsecase>((i) => UpdateUser(userRepository: i())),
    //* repositories
    Bind.lazySingleton<IUserRepository>(
        (i) => UserRepositoryImpl(userDataSource: i())),
    //* datasources
    Bind.lazySingleton<IUserDataSource>(
        (i) => UserFirestoreDataSourceImpl(firestore: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const ProfilePage(),
    ),
  ];
}

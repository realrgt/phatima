import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/no_params.dart';
import '../../domain/entities/logged_user.dart';
import '../../domain/usecases/get_logged_user.dart';
import '../../domain/usecases/login_with_google.dart';
import '../../domain/usecases/logout.dart';
import 'login_event.dart';
import 'login_state.dart';

abstract class BloC<Event, State> {
  Stream<State> mapEventToState(Event event);
  void dispose();
}

class LoginBloc implements BloC<LoginEvent, LoginState> {
  final GetLoggedUser _getLoggedUser;
  final LoginWithGoogle _loginWithGoogle;
  final Logout _logout;

  LoginBloc(
    this._getLoggedUser,
    this._loginWithGoogle,
    this._logout,
  );

  final _subject = BehaviorSubject<LoginEvent>();
  StreamSink<LoginEvent> get event => _subject.sink;
  Stream<LoginState> get state => _subject.switchMap(mapEventToState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthenticateUser) {
      yield LoginInitial();
      yield LoginLoading();
      final failureOrUser = await _loginWithGoogle(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrUser);
    } else if (event is SignUserOut) {
      yield LoginInitial();
      yield LoginLoading();
      final failureOrUnit = await _logout(NoParams());
      yield failureOrUnit.fold(
        (failure) => LoginError(message: failure.message),
        (unit) => LoginLoaded(user: null),
      );
    } else if (event is GetCurrentUser) {
      yield LoginInitial();
      yield LoginLoading();
      final failureOrUser = await _getLoggedUser(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrUser);
    }
  }

  @override
  void dispose() {
    _subject.close();
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, LoggedUser> failureOrUser,
  ) async* {
    yield failureOrUser.fold(
      (failure) => LoginError(message: failure.message),
      (loggedUser) => LoginLoaded(user: loggedUser),
    );
  }
}

import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../modules/auth/domain/usecases/get_logged_user.dart';
import '../../../modules/auth/domain/usecases/logout.dart';
import '../../util/no_params.dart';
import '../bloc_base.dart';
import 'bloc.dart';

class AuthBloc implements BloC<AuthEvent, AuthState> {
  final GetLoggedUser _getLoggedUser;
  final Logout _logout;

  AuthBloc(this._getLoggedUser, this._logout);

  final _subject = BehaviorSubject<AuthEvent>();
  StreamSink<AuthEvent> get sink => _subject.sink;
  Stream<AuthState> get stream => _subject.switchMap(mapEventToState);

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is SignedIn) {
      yield* _mapSignedInToState();
    } else if (event is SignedOut) {
      yield* _mapSignedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    final failureOrUser = await _getLoggedUser(NoParams());
    yield failureOrUser.fold(
      (failure) => Unauthenticated(),
      (loggedUser) => Authenticated(user: loggedUser),
    );
  }

  Stream<AuthState> _mapSignedInToState() async* {
    final failureOrUser = await _getLoggedUser(NoParams());
    yield failureOrUser.fold(
      (failure) => AuthError(message: failure.message),
      (loggedUser) => Authenticated(user: loggedUser),
    );
  }

  Stream<AuthState> _mapSignedOutToState() async* {
    final failureOrUnit = await _logout(NoParams());
    yield failureOrUnit.fold(
      (failure) => AuthError(message: failure.message),
      (unit) => Unauthenticated(),
    );
  }

  @override
  void dispose() {
    _subject.close();
  }
}

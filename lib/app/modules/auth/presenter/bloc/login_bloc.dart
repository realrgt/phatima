import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/domain/entities/params.dart';
import '../../../../core/domain/error/failures.dart';
import '../../../../core/presenter/blocs/bloc_base.dart';
import '../../domain/entities/logged_user.dart';
import '../../domain/usecases/login_with_google.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc implements BloC<LoginEvent, LoginState> {
  final LoginWithGoogle _loginWithGoogle;

  LoginBloc({required LoginWithGoogle loginWithGoogle})
      : _loginWithGoogle = loginWithGoogle;

  final _subject = BehaviorSubject<LoginEvent>();
  StreamSink<LoginEvent> get sink => _subject.sink;
  Stream<LoginState> get stream => _subject.switchMap(mapEventToState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignUserIn) {
      yield LoginInitial();
      yield LoginLoading();
      final failureOrUser = await _loginWithGoogle(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrUser);
    }
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, LoggedUser> failureOrUser,
  ) async* {
    yield failureOrUser.fold(
      (failure) => LoginError(message: failure.message),
      (loggedUser) => LoginLoaded(user: loggedUser),
    );
  }

  @override
  void dispose() {
    _subject.close();
  }
}

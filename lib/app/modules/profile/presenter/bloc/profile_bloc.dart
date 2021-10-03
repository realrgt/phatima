import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../../core/domain/util/constants/messages.dart';
import '../../../../core/presenter/blocs/bloc_base.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/update_user.dart';
import 'bloc.dart';

class ProfileBloc extends BloC<ProfileEvent, ProfileState> {
  final GetUser _getUser;
  final UpdateUser _upateUser;

  ProfileBloc({
    required GetUser getUser,
    required UpdateUser upateUser,
  })  : _getUser = getUser,
        _upateUser = upateUser;

  final _subject = BehaviorSubject<ProfileEvent>();
  StreamSink<ProfileEvent> get sink => _subject.sink;
  Stream<ProfileState> get stream => _subject.switchMap(mapEventToState);

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is EnteredProfileTab) {
      yield* _mapEnteredProfileTabToState(event);
    } else if (event is UpdatedProfile) {
      yield* _mapUpdatedProfileToState(event);
    }
  }

  Stream<ProfileState> _mapEnteredProfileTabToState(
    ProfileEvent event,
  ) async* {
    yield ProfileInitial();
    yield ProfileLoading();
    final failureOrUser = await _getUser(UserGetParams(uid: event.userID!));
    yield failureOrUser.fold(
      (failure) => const ProfileError(message: profileUpdateErrorMessage),
      (user) => ProfileLoaded(user: user),
    );
  }

  Stream<ProfileState> _mapUpdatedProfileToState(
    ProfileEvent event,
  ) async* {
    yield ProfileInitial();
    yield ProfileLoading();
    final failureOrUnit = await _upateUser(UserUpdateParams(user: event.user!));
    yield failureOrUnit.fold(
      (failure) => const ProfileError(message: profileLoadErrorMessage),
      (unit) => ProfileLoaded(user: event.user!),
    );
  }

  @override
  void dispose() {
    _subject.close();
  }
}

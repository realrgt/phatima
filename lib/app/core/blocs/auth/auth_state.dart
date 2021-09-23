import 'package:equatable/equatable.dart';

import '../../../modules/auth/domain/entities/logged_user.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class Uninitialized extends AuthState {}

class Authenticated extends AuthState {
  final LoggedUser user;

  const Authenticated({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { user: $user }';
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String? message;
  const AuthError({this.message});
}

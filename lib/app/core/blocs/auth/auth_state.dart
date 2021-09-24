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
  const Authenticated({required this.user}) : super();

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String? message;
  const AuthError({this.message}) : super();
}

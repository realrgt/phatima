import 'package:phatima/app/modules/auth/domain/entities/logged_user.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoggedUser? user;
  LoginLoaded({required this.user});
}

class LoginError extends LoginState {
  final String? message;
  LoginError({this.message});
}

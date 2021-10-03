import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class ProfileState extends Equatable {
  final User? user;
  final String? errorMsg;
  const ProfileState({this.user, this.errorMsg});

  @override
  List<Object?> get props => [user, errorMsg];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded({required User user}) : super(user: user);
}

class ProfileError extends ProfileState {
  const ProfileError({required String message}) : super(errorMsg: message);
}

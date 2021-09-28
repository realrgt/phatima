import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class ProfileEvent extends Equatable {
  final User? user;
  const ProfileEvent({this.user});

  @override
  List<Object?> get props => [user];
}

class EnteredProfileTab extends ProfileEvent {
  const EnteredProfileTab({required User user}) : super(user: user);
}

class UpdatedProfile extends ProfileEvent {
  const UpdatedProfile({required User user}) : super(user: user);
}

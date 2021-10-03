import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class ProfileEvent extends Equatable {
  final String? userID;
  final User? user;
  const ProfileEvent({this.userID, this.user});

  @override
  List<Object?> get props => [user];
}

class EnteredProfileTab extends ProfileEvent {
  const EnteredProfileTab({required String uid}) : super(userID: uid);
}

class UpdatedProfile extends ProfileEvent {
  const UpdatedProfile({required User user}) : super(user: user);
}

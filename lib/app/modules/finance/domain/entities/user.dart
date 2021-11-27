import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String displayName;
  final double ballance;

  const User({
    required this.uid,
    required this.displayName,
    required this.ballance,
  });

  @override
  List<Object> get props => [uid, displayName, ballance];
}

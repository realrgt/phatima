import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String uid;
  final String displayName;
  final String photoURL;
  final String? phone;
  final String email;
  final String? address;
  final double? ballance;
  final DateTime createdAt;

  const LoggedUser({
    required this.uid,
    required this.displayName,
    required this.photoURL,
    this.phone,
    required this.email,
    this.address,
    this.ballance,
    required this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      uid,
      displayName,
      photoURL,
      phone,
      email,
      address,
      ballance,
      createdAt,
    ];
  }
}

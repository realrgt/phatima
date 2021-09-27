import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String photoURL;
  final String displayName;
  final String email;
  final String? phone;
  final String? address;

  const User({
    required this.uid,
    required this.photoURL,
    required this.displayName,
    required this.email,
    this.phone,
    this.address,
  });

  @override
  List<Object?> get props {
    return [
      uid,
      photoURL,
      displayName,
      email,
      phone,
      address,
    ];
  }
}

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String photoURL;
  final String displayName;
  final String email;
  final String? phone;
  final String? address;

  const User({
    required this.photoURL,
    required this.displayName,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  List<Object?> get props {
    return [
      photoURL,
      displayName,
      email,
      phone,
      address,
    ];
  }
}

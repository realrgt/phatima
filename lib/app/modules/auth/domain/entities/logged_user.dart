import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String displayName;
  final String avatar;
  final String phone;
  final String email;
  final String address;
  final double ballance;
  final DateTime createdAt;

  const LoggedUser({
    required this.displayName,
    required this.avatar,
    required this.phone,
    required this.email,
    required this.address,
    required this.ballance,
    required this.createdAt,
  });

  @override
  List<Object> get props {
    return [
      displayName,
      avatar,
      phone,
      email,
      address,
      ballance,
      createdAt,
    ];
  }
}

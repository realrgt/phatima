import 'dart:convert';

import '../../domain/entities/logged_user.dart';

class LoggedUserModel extends LoggedUser {
  const LoggedUserModel({
    required String displayName,
    required String avatar,
    required String phone,
    required String email,
    required String address,
    required double ballance,
    required DateTime createdAt,
  }) : super(
            displayName: displayName,
            avatar: avatar,
            phone: phone,
            email: email,
            address: address,
            ballance: ballance,
            createdAt: createdAt);

  factory LoggedUserModel.fromMap(Map<String, dynamic> map) {
    return LoggedUserModel(
      displayName: map['displayName'],
      avatar: map['avatar'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'],
      ballance: map['ballance'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'avatar': avatar,
      'phone': phone,
      'email': email,
      'address': address,
      'ballance': ballance,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  factory LoggedUserModel.fromJson(String source) =>
      LoggedUserModel.fromMap(json.decode(source));
}

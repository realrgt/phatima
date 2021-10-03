import 'dart:convert';

import '../../domain/entities/logged_user.dart';

class LoggedUserModel extends LoggedUser {
  const LoggedUserModel({
    required String uid,
    required String displayName,
    required String photoURL,
    String? phone,
    required String email,
    String? address,
    double? ballance,
    required DateTime createdAt,
  }) : super(
            uid: uid,
            displayName: displayName,
            photoURL: photoURL,
            phone: phone,
            email: email,
            address: address,
            ballance: ballance,
            createdAt: createdAt);

  factory LoggedUserModel.fromMap(Map<String, dynamic> map) {
    return LoggedUserModel(
      uid: map['uid'],
      displayName: map['displayName'],
      photoURL: map['photoURL'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'],
      ballance: map['ballance'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'photoURL': photoURL,
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

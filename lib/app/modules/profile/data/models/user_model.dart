import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String uid,
    required String photoURL,
    required String displayName,
    required String email,
    String? phone,
    String? address,
  }) : super(
            uid: uid,
            photoURL: photoURL,
            displayName: displayName,
            email: email,
            phone: phone,
            address: address);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'photoURL': photoURL,
      'displayName': displayName,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      photoURL: map['photoURL'],
      displayName: map['displayName'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String uid,
    required String displayName,
    required double ballance,
  }) : super(
          uid: uid,
          ballance: ballance,
          displayName: displayName,
        );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'ballance': ballance,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      displayName: map['displayName'],
      ballance: map['ballance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

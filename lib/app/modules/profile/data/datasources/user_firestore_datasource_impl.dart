import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/constants.dart';
import '../models/user_model.dart';
import 'user_datasource.dart';

class UserFirestoreDataSourceImpl implements IUserDataSource {
  final FirebaseFirestore _firestore;
  UserFirestoreDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<UserModel> getUser(String uid) async {
    final document = await _firestore.collection(userCollection).doc(uid).get();
    if (!document.exists) throw ServerException();
    return UserModel.fromMap(document.data()!);
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await _firestore
        .collection(userCollection)
        .doc(user.uid)
        .update(user.toMap());
  }
}

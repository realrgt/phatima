import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/util/constants.dart';
import '../models/logged_user_model.dart';
import 'user_datasource.dart';

class UserFirestoreImpl implements IUserDataSource {
  final FirebaseFirestore _firestore;
  UserFirestoreImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> createUserRecord(LoggedUserModel user) async {
    await _firestore.collection(userCollection).doc(user.uid).set(user.toMap());
  }
}

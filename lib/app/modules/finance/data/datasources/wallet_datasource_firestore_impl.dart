import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/util/constants/firebase.dart';
import '../models/user_model.dart';
import 'wallet_datasource.dart';

class WalletDataSourceFirestoreImpl implements IWalletDataSource {
  final FirebaseFirestore _firestore;

  WalletDataSourceFirestoreImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<double> getAccountBallance(String uid) async {
    final document = await _firestore.collection(userCollection).doc(uid).get();
    if (!document.exists) throw ServerException();
    final user = UserModel.fromMap(document.data()!);
    return user.ballance;
  }

  @override
  Future<void> rechargeAccount(String uid, double value) async {
    await _firestore
        .collection(userCollection)
        .doc(uid)
        .update({"ballance": value});
  }
}

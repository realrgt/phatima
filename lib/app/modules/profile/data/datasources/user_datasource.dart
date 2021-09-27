import '../models/user_model.dart';

abstract class IUserDataSource {
  Future<UserModel> getUser(String uid);
  Future<void> updateUser(UserModel user);
}

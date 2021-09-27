import '../models/logged_user_model.dart';

abstract class IUserDataSource {
  Future<void> createUserRecord(LoggedUserModel user);
}

import '../models/logged_user_model.dart';

abstract class IAuthDataSource {
  Future<LoggedUserModel> loginWithGoogle();
  Future<LoggedUserModel> getLoggedUser();
  Future<void> logout();
}

import '../../domain/entities/logged_user.dart';

abstract class IAuthDataSource {
  Future<LoggedUser> loginWithGoogle();
  Future<LoggedUser> getLoggedUser();
  Future<void> logout();
}

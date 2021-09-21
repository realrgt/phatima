class ServerException implements Exception {
  final String? message;

  ServerException({this.message});
}

class LoggedUserException implements Exception {
  final String? message;

  LoggedUserException({this.message});
}

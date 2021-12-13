class ServerException implements Exception {
  final String? message;

  ServerException({this.message});
}

class LoggedUserException implements Exception {
  final String? message;

  LoggedUserException({this.message});
}

class PaymentException implements Exception {
  final String? message;

  PaymentException({this.message});
}

class PhoneFormatException implements Exception {
  final String? message;

  PhoneFormatException({this.message});
}

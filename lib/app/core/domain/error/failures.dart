import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;
  const Failure({this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {}

class LoggedUserFailure extends Failure {}

class PaymentFailure extends Failure {}

class PhoneFormatFailure extends Failure {}

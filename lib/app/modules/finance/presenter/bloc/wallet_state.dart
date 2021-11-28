import 'package:equatable/equatable.dart';

abstract class WalletState extends Equatable {
  final double? value;
  final String? errorMsg;

  const WalletState({this.value, this.errorMsg});

  @override
  List<Object?> get props => [value, errorMsg];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  const WalletLoaded({required double value}) : super(value: value);
}

class WalletError extends WalletState {
  const WalletError({required String message}) : super(errorMsg: message);
}

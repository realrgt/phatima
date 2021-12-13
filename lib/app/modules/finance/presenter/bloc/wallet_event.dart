import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  final String uid;
  final double? value;
  final String? phone;

  const WalletEvent({required this.uid, this.value, this.phone});

  @override
  List<Object?> get props => [uid, value];
}

class SeeMoney extends WalletEvent {
  const SeeMoney({required String uid}) : super(uid: uid);
}

class PlaceMoney extends WalletEvent {
  const PlaceMoney({
    required String uid,
    required double value,
    required String phone,
  }) : super(uid: uid, value: value, phone: phone);
}

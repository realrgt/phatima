import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  final String uid;
  final double? value;

  const WalletEvent({required this.uid, this.value});

  @override
  List<Object?> get props => [uid, value];
}

class SeeMoney extends WalletEvent {
  const SeeMoney({required String uid}) : super(uid: uid);
}

class PlaceMoney extends WalletEvent {
  const PlaceMoney({required String uid, required double value})
      : super(uid: uid, value: value);
}

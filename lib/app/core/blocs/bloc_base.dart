import 'package:flutter_modular/flutter_modular.dart';

abstract class BloC<Event, State> implements Disposable {
  Stream<State> mapEventToState(Event event);

  @override
  void dispose();
}

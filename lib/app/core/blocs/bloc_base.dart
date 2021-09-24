abstract class BloC<Event, State> {
  Stream<State> mapEventToState(Event event);
  void dispose();
}

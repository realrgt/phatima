import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../theme/app_themes.dart';
import '../bloc_base.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends BloC<ThemeEvent, ThemeState> {
  final _subject = BehaviorSubject<ThemeEvent>();
  StreamSink<ThemeEvent> get sink => _subject.sink;
  Stream<ThemeState> get state => _subject.switchMap(mapEventToState);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]!);
    }
  }

  @override
  void dispose() {
    _subject.close();
  }
}

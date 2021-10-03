import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc_base.dart';

enum PageChangedEvent { home, orders, finances, profile }

const homePageIndex = 0;
const ordersPageIndex = 1;
const financePageIndex = 2;
const profalePageIndex = 3;

class PageToggleBloc extends BloC<PageChangedEvent, int> {
  final _subject = BehaviorSubject<PageChangedEvent>();
  StreamSink<PageChangedEvent> get sink => _subject.sink;
  Stream<int> get stream => _subject.switchMap(mapEventToState);

  @override
  Stream<int> mapEventToState(PageChangedEvent event) async* {
    if (event == PageChangedEvent.home) {
      Modular.to.navigate('../home/');
      yield homePageIndex;
    } else if (event == PageChangedEvent.orders) {
      Modular.to.navigate('../orders/');
      yield ordersPageIndex;
    } else if (event == PageChangedEvent.finances) {
      Modular.to.navigate('../finances/');
      yield financePageIndex;
    } else if (event == PageChangedEvent.profile) {
      Modular.to.navigate('../profile/');
      yield profalePageIndex;
    }
  }

  int setIndex(int value) {
    switch (value) {
      case 1:
        sink.add(PageChangedEvent.orders);
        break;
      case 2:
        sink.add(PageChangedEvent.finances);
        break;
      case 3:
        sink.add(PageChangedEvent.profile);
        break;
      default:
        sink.add(PageChangedEvent.home);
    }
    return value;
  }

  @override
  void dispose() {
    _subject.close();
  }
}

import 'package:rxdart/subjects.dart' show BehaviorSubject, ReplaySubject;

class CounterBloc {
  CounterBloc()
      : _counterSubject = BehaviorSubject<int>.seeded(0),
        _incrementCounterSubject = ReplaySubject<void>() {
    _incrementCounterSubject
        .listen((void _) => _counterSubject.add(_counterSubject.value + 1));
  }

  final BehaviorSubject<int> _counterSubject;
  Stream<int> get counter => _counterSubject.stream;

  final ReplaySubject<void> _incrementCounterSubject;
  Sink<void> get incrementCounterSink => _incrementCounterSubject.sink;
}

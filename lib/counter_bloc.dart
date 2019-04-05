import 'package:rxdart/subjects.dart' show BehaviorSubject, ReplaySubject;

abstract class CounterRepo {
  Future<int> get counterValue;
  Future<void> setCounterValue(int newValue);
}

class CounterBloc {
  CounterBloc(this.counterRepo)
      : _counterSubject = BehaviorSubject<int>.seeded(0),
        _incrementCounterSubject = ReplaySubject<void>() {
    _incrementCounterSubject
        .listen((void _) async {
      final int newValue = await counterRepo.counterValue + 1;
      counterRepo.setCounterValue(newValue);
      _counterSubject.add(newValue);

    });
  }
  final CounterRepo counterRepo;

  final BehaviorSubject<int> _counterSubject;
  Stream<int> get counter => _counterSubject.stream;

  final ReplaySubject<void> _incrementCounterSubject;
  Sink<void> get incrementCounterSink => _incrementCounterSubject.sink;
}

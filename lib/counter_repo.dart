import 'package:clean_architecture_flutter_bloc/counter_bloc.dart' show CounterRepo;

class CounterRepoImp implements CounterRepo {
  int _value = 0;

  @override
  Future<int> get counterValue => Future<int>.value(_value);

  @override
  Future<void> setCounterValue(int newValue) async {
    _value = newValue;
  }

}
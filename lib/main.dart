import 'package:flutter/material.dart';
import 'package:clean_architecture_flutter_bloc/counter_bloc.dart'
    show CounterBloc;
import 'package:clean_architecture_flutter_bloc/counter_widget.dart' show MyApp;

void main() => runApp(MyApp(CounterBloc()));

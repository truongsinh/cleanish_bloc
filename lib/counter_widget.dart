import 'package:flutter/material.dart';
import 'package:clean_architecture_flutter_bloc/counter_bloc.dart' show CounterBloc;

class MyApp extends InheritedWidget {
  MyApp(this.counterBloc)
      : super(
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    ),
  );
  final CounterBloc counterBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // we never need to change any injected dependencies
    return false;
  }

  static CounterBloc counterBlocOf(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MyApp) as MyApp).counterBloc;
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: MyApp.counterBlocOf(context).counter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(
                    snapshot.hasData ? '${snapshot.data}' : '0',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            MyApp.counterBlocOf(context).incrementCounterSink.add(null),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

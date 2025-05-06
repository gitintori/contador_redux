import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/reducer.dart';
import 'redux/state.dart';
import 'redux/store.dart';

void main() {
  final store = createStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<CounterState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Flutter Redux Demo'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CounterState, int>(
      converter: (store) => store.state.counter,
      builder: (context, counter) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have pushed the button this many times:'),
                Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                onPressed: () {
                  StoreProvider.of<CounterState>(context).dispatch(IncrementAction());
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                heroTag: 'remove',
                onPressed: () {
                  StoreProvider.of<CounterState>(context).dispatch(DecrementAction());
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}

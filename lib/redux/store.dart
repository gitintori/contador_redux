import 'package:redux/redux.dart';
import 'state.dart';
import 'reducer.dart';

Store<CounterState> createStore() {
  return Store<CounterState>(
    counterReducer,
    initialState: CounterState(counter: 0),
  );
}

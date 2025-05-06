import 'state.dart';

// Ações
class IncrementAction {}
class DecrementAction {}

// Redutor
CounterState counterReducer(CounterState state, dynamic action) {
  if (action is IncrementAction) {
    return CounterState(counter: state.counter + 1);
  } else if (action is DecrementAction) {
    return CounterState(counter: state.counter - 1);
  }

  return state;
}

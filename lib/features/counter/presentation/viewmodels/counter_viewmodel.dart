import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_state.dart';

final counterProvider = StateNotifierProvider<CounterViewModel, CounterState>(
  (ref) => CounterViewModel(),
);

class CounterViewModel extends StateNotifier<CounterState> {
  CounterViewModel() : super(const CounterState());

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
}
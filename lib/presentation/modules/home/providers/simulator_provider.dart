
import 'package:flutter_riverpod/flutter_riverpod.dart';

final simulatorProvider = StateNotifierProvider<SimulatorNotifier, SimulatorState>((ref) {
  return SimulatorNotifier();
});


class SimulatorNotifier extends StateNotifier<SimulatorState> {

  SimulatorNotifier() : super(const SimulatorState());

}

class SimulatorState {

  const SimulatorState();

  SimulatorState copyWith({
    String? controller
  }) => SimulatorState();

}
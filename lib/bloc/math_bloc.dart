import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'math_state.dart';

enum MathEvent { add, subtract, half, by2 }

class MathBloc extends Bloc<MathEvent, double> {
  MathBloc() : super(0.0);

  @override
  Stream<double> mapEventToState(MathEvent event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case MathEvent.add:
        yield state + 1;
        break;
      case MathEvent.subtract:
        yield state - 1;
        break;
      case MathEvent.half:
        yield state / 2;
        break;
      case MathEvent.by2:
        yield state * 2;
        break;
      default:
    }
  }
}

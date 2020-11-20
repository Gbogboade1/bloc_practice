import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simplecalculator_event.dart';
part 'simplecalculator_state.dart';

class SimplecalculatorBloc extends Bloc<SimplecalculatorEvent, SimplecalculatorState> {
  SimplecalculatorBloc() : super(SimplecalculatorInitial());

  @override
  Stream<SimplecalculatorState> mapEventToState(
    SimplecalculatorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

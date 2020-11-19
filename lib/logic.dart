import 'package:bloc/bloc.dart';
import 'package:e_report/events.dart';
import 'package:e_report/states.dart';
import 'package:flutter/material.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc({@required CounterBlocState initialState}) : super(initialState);

  @override
  Stream<CounterBlocState> mapEventToState(CounterBlocEvent event) async* {
    if (event is IncreaseCounterEvent) {
      int currentCounterValue = (state as LatestCounterState).newCounterValue;

      int newCounterValue = currentCounterValue + 1;

      yield LatestCounterState(newCounterValue: newCounterValue);
    } else if (event is DecreaseCounterEvent) {
      int currentCounterValue = (state as LatestCounterState).newCounterValue;
      int newCounterValue = currentCounterValue - 1;
      yield LatestCounterState(newCounterValue: newCounterValue);
    } else if (event is DoubleCounterEvent) {
      int currentCounterValue = (state as LatestCounterState).newCounterValue;
      int newCounterValue = currentCounterValue * 2;
      yield LatestCounterState(newCounterValue: newCounterValue);
    } else if (event is SquareCounterEvent) {
      int currentCounterValue = (state as LatestCounterState).newCounterValue;
      int newCounterValue = currentCounterValue * currentCounterValue;
      yield LatestCounterState(newCounterValue: newCounterValue);
    }
  }
}

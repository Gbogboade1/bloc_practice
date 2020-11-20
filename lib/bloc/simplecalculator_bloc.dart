import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simplecalculator_event.dart';
part 'simplecalculator_state.dart';

class SimplecalculatorBloc
    extends Bloc<SimplecalculatorEvent, SimplecalculatorState> {
  SimplecalculatorBloc() : super(SimplecalculatorInitial());

  @override
  Stream<SimplecalculatorState> mapEventToState(
      SimplecalculatorEvent event) async* {
    if (event is CalcOperation) {
      // TODO: implement logic of operation pressed
      switch (event.op) {
        case CalculatorOperations.add:
        case CalculatorOperations.subtract:
        case CalculatorOperations.multiply:
        case CalculatorOperations.divide:
        case CalculatorOperations.square:
        case CalculatorOperations.clear:
        case CalculatorOperations.clearAll:
        case CalculatorOperations.result:
          break;
        default:
      }
    } else if (event is CalcNumPad) {
      // TODO: implement logic of operation pressed

      switch (event.digit) {
        case CalculatorDigits.i:
        case CalculatorDigits.ii:
        case CalculatorDigits.iii:
        case CalculatorDigits.iv:
        case CalculatorDigits.v:
        case CalculatorDigits.vi:
        case CalculatorDigits.vii:
        case CalculatorDigits.ix:
        case CalculatorDigits.dot:
        case CalculatorDigits.zero:
        case CalculatorDigits.zero2:
          break;
        default:
      }
    }
  }
}

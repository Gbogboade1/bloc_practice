import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_report/functions.dart';
import 'package:e_report/result_processor.dart';
import 'package:equatable/equatable.dart';

part 'simplecalculator_event.dart';
part 'simplecalculator_state.dart';

class SimplecalculatorBloc
    extends Bloc<SimplecalculatorEvent, SimplecalculatorState> {
  SimplecalculatorBloc() : super(CurrentCalculatorState());

  @override
  Stream<SimplecalculatorState> mapEventToState(
      SimplecalculatorEvent event) async* {
    if (event is CalcOperation) {
      CurrentCalculatorState calc = state as CurrentCalculatorState;
      switch (event.op) {
        case CalculatorOperations.add:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "+"),
            );
          }
          break;
        case CalculatorOperations.subtract:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "-"),
            );
          }
          break;
        case CalculatorOperations.multiply:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "*"),
            );
          }
          break;
        case CalculatorOperations.divide:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "/"),
            );
          }
          break;
        case CalculatorOperations.square:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "^2"),
            );
          }
          break;
        case CalculatorOperations.clear:
          {
            var nl = deleteLastDigitLastChar(calc.calculatorData.toList());
            yield CurrentCalculatorState(
              calculatorData: nl,
            );
          }
          break;
        case CalculatorOperations.clearAll:
          {
            yield CurrentCalculatorState(
              calculatorData: ["0"],
            );
          }
          break;
        case CalculatorOperations.result:
          {
            yield CurrentCalculatorState(
              calculatorData: ["${calcResult(calc.calculatorData.toList())}"],
            );
          }
          break;
        default:
      }
    } else if (event is CalcNumPad) {
      // TODO: implement logic of operation pressed

      List<String> r =
          (state as CurrentCalculatorState).calculatorData.toList();
      switch (event.digit) {
        case CalculatorDigits.i:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "1"),
            );
          }

          break;
        case CalculatorDigits.ii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "2"),
            );
          }

          break;
        case CalculatorDigits.iii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "3"),
            );
          }

          break;
        case CalculatorDigits.iv:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "4"),
            );
          }

          break;
        case CalculatorDigits.v:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "5"),
            );
          }

          break;
        case CalculatorDigits.vi:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "6"),
            );
          }

          break;
        case CalculatorDigits.vii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "7"),
            );
          }

          break;
        case CalculatorDigits.viii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "8"),
            );
          }

          break;
        case CalculatorDigits.vii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "7"),
            );
          }

          break;
        case CalculatorDigits.ix:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "9"),
            );
          }

          break;
        case CalculatorDigits.dot:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "."),
            );
          }

          break;
        case CalculatorDigits.zero:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "0"),
            );
          }

          break;
        case CalculatorDigits.zero2:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "00"),
            );
          }

          break;
        default:
      }
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_report/functions.dart';
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
      // TODO: implement logic of operation pressed

      CurrentCalculatorState calc = state as CurrentCalculatorState;
      switch (event.op) {
        case CalculatorOperations.add:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "+"),
              result: "15",
            );
          }
          break;
        case CalculatorOperations.subtract:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "-"),
              result: "15",
            );
          }
          break;
        case CalculatorOperations.multiply:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "*"),
              result: "15",
            );
          }
          break;
        case CalculatorOperations.divide:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "/"),
              result: "15",
            );
          }
          break;
        case CalculatorOperations.square:
          {
            yield CurrentCalculatorState(
              calculatorData: addOperator(calc.calculatorData.toList(), "^2"),
              result: "15",
            );
          }
          break;
        case CalculatorOperations.clear:
          {
            //delete last char
            var l = calc.calculatorData.toList();
            var nl = deleteLastChar(calc.calculatorData.toList());
            yield CurrentCalculatorState(
              calculatorData: nl,
              result: "",
            );
          }
          break;
        case CalculatorOperations.clearAll:
          {
            //delete all input

            yield CurrentCalculatorState(
              calculatorData: ["0"],
              result: "",
            );
          }
          break;
        case CalculatorOperations.result:
          {
            yield CurrentCalculatorState(
              calculatorData: calc.calculatorData,
              result: "",
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
              result: "res",
            );
          }

          break;
        case CalculatorDigits.ii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "2"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.iii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "3"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.iv:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "4"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.v:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "5"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.vi:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "6"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.vii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "7"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.viii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "8"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.vii:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "7"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.ix:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "9"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.dot:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "."),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.zero:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "0"),
              result: "res",
            );
          }

          break;
        case CalculatorDigits.zero2:
          {
            yield CurrentCalculatorState(
              calculatorData: updateLastDigit(r, "00"),
              result: "res",
            );
          }

          break;
        default:
      }
    }
  }
}

import 'package:e_report/bloc/simplecalculator_bloc.dart';
import 'package:flutter/material.dart';

enum CharType {
  numberDouble,
  numberInt,
  operatorSign,
  empty,
}

class CalcItem {
  final String boxValue;
  final SimplecalculatorEvent event;

  CalcItem({
    @required this.boxValue,
    @required this.event,
  });
}

List<CalcItem> calcList = [
  //ROW 1
  CalcItem(boxValue: "7", event: CalcNumPad(digit: CalculatorDigits.vii)),
  CalcItem(boxValue: "8", event: CalcNumPad(digit: CalculatorDigits.viii)),
  CalcItem(boxValue: "9", event: CalcNumPad(digit: CalculatorDigits.ix)),
  CalcItem(
      boxValue: "del", event: CalcOperation(op: CalculatorOperations.clear)),
  CalcItem(
      boxValue: "Clear",
      event: CalcOperation(op: CalculatorOperations.clearAll)),

  //ROW 2
  CalcItem(boxValue: "4", event: CalcNumPad(digit: CalculatorDigits.iv)),
  CalcItem(boxValue: "5", event: CalcNumPad(digit: CalculatorDigits.v)),
  CalcItem(boxValue: "6", event: CalcNumPad(digit: CalculatorDigits.vi)),
  CalcItem(boxValue: "+", event: CalcOperation(op: CalculatorOperations.add)),
  CalcItem(
      boxValue: "-", event: CalcOperation(op: CalculatorOperations.subtract)),

  //ROW 1
  CalcItem(boxValue: "1", event: CalcNumPad(digit: CalculatorDigits.i)),
  CalcItem(boxValue: "2", event: CalcNumPad(digit: CalculatorDigits.ii)),
  CalcItem(boxValue: "3", event: CalcNumPad(digit: CalculatorDigits.iii)),
  CalcItem(
      boxValue: "*", event: CalcOperation(op: CalculatorOperations.multiply)),
  CalcItem(
      boxValue: "/", event: CalcOperation(op: CalculatorOperations.divide)),

  //ROW 1
  CalcItem(boxValue: ".", event: CalcNumPad(digit: CalculatorDigits.dot)),
  CalcItem(boxValue: "0", event: CalcNumPad(digit: CalculatorDigits.zero)),
  CalcItem(boxValue: "00", event: CalcNumPad(digit: CalculatorDigits.zero2)),
  CalcItem(
      boxValue: "^2", event: CalcOperation(op: CalculatorOperations.square)),
  CalcItem(
      boxValue: "=", event: CalcOperation(op: CalculatorOperations.result)),
];

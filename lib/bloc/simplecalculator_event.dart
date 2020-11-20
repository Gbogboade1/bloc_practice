part of 'simplecalculator_bloc.dart';

enum CalculatorOperations {
  add,
  subtract,
  multiply,
  divide,
  square,
  del,
  clear,
  clearAll,
  result,
}

enum CalculatorDigits {
  i,
  ii,
  iii,
  iv,
  v,
  vi,
  vii,
  viii,
  ix,
  zero,
  zero2,
  dot,
}

abstract class SimplecalculatorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CalcOperation extends SimplecalculatorEvent {
  final CalculatorOperations op;

  CalcOperation({this.op});
}

class CalcNumPad extends SimplecalculatorEvent {
  final CalculatorDigits digit;

  CalcNumPad({this.digit});
}

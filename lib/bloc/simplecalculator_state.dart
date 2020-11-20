part of 'simplecalculator_bloc.dart';

abstract class SimplecalculatorState extends Equatable {}

class CurrentCalculatorState extends SimplecalculatorState {
  final List<String> calculatorData;
  final String result;

  CurrentCalculatorState({
    this.calculatorData: const ["0"],
    this.result: "0",
  });

  @override
  List<Object> get props => [calculatorData, result];
}

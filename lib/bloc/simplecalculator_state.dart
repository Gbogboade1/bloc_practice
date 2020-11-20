part of 'simplecalculator_bloc.dart';

abstract class SimplecalculatorState extends Equatable {
  const SimplecalculatorState();
}

class SimplecalculatorInitial extends SimplecalculatorState {
  final List<String> calculatorData;

  SimplecalculatorInitial({this.calculatorData: const []});

  @override
  List<Object> get props => calculatorData;
  
}

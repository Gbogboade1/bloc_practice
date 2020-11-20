part of 'math_bloc.dart';

abstract class MathState extends Equatable {
  const MathState();
  
  @override
  List<Object> get props => [];
}

class MathInitial extends MathState {}

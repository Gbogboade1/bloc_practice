import 'package:equatable/equatable.dart';

//Base Class for Bloc Event extends Equatable to make it comparable
abstract class CounterBlocEvent extends Equatable {}

class DecreaseCounterEvent extends CounterBlocEvent {
  //overide this method when class extends equatable

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IncreaseCounterEvent extends CounterBlocEvent {
//overide this method when class extends equatable

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DoubleCounterEvent extends CounterBlocEvent {
//overide this method when class extends equatable

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SquareCounterEvent extends CounterBlocEvent {
//overide this method when class extends equatable

  @override
  // TODO: implement props
  List<Object> get props => [];
}

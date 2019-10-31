import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerState extends Equatable {
  const CircleTimerState();

  @override
  List<Object> get props => [];
}

class CircleTimerLoading extends CircleTimerState {}

class CircleTimerLoaded extends CircleTimerState {
  final double nextIntake;

  const CircleTimerLoaded(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class CircleTimerZero extends CircleTimerState {
  final double nextIntake;

  const CircleTimerZero(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class CircleTimerNotLoaded extends CircleTimerState{}
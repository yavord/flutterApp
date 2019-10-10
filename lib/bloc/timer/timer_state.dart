import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerState extends Equatable {
  CircleTimerState([List props = const[]]) : super(props);
}

class CircleTimerLoading extends CircleTimerState {}

class CircleTimerLoaded extends CircleTimerState {
  final double nextIntake;

  CircleTimerLoaded(this.nextIntake) : super([nextIntake]);
}

class CircleTimerZero extends CircleTimerState {}

class CircleTimerNotLoaded extends CircleTimerState{}
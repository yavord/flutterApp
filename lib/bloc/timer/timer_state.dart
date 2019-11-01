import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

class TimerLoading extends TimerState {}

class TimerLoaded extends TimerState {
  final double nextIntake;

  const TimerLoaded(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class TimerZero extends TimerState {
  final double nextIntake;

  const TimerZero(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class TimerNotLoaded extends TimerState{}
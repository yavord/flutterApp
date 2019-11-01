import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class TimerState extends Equatable {
  final double nextIntake;

  const TimerState(this.nextIntake);

  @override
  List<Object> get props => [];
}


class TimerReady extends TimerState {
  final double nextIntake;

  const TimerReady(this.nextIntake) : super(nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class TimerRunning extends TimerState{
  final double nextIntake;

  const TimerRunning(this.nextIntake) : super(nextIntake);
}

class TimerZero extends TimerState {
  final double nextIntake;

  const TimerZero(this.nextIntake) : super(nextIntake);

  @override
  List<Object> get props => [nextIntake];
}
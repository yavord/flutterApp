import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:proba123/models/models.dart';




@immutable
abstract class TimerState extends Equatable {
  final NextIntake nextIntake;

  const TimerState(this.nextIntake);

  @override
  List<Object> get props => [];
}

class TimerReady extends TimerState {
  final NextIntake nextIntake;

  const TimerReady(this.nextIntake) : super(nextIntake);

  @override
  List<Object> get props => [nextIntake];

  @override
  String toString() => 'Timer Ready: {nextIntake : $nextIntake}';
}

class TimerRunning extends TimerState{
  final NextIntake nextIntake;

  const TimerRunning(this.nextIntake) : super(nextIntake);

  @override
  String toString() => 'Timer Running: {nextIntake : $nextIntake}';
}

class TimerZero extends TimerState {
  const TimerZero() : super(null);
}

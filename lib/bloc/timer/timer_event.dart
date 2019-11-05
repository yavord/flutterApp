import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:proba123/models/models.dart';


@immutable
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class StartTimer extends TimerEvent {
  final NextIntake nextIntake;

  const StartTimer(this.nextIntake);

  @override
  List<Object> get props => [];
}

class Tick extends TimerEvent {
  final NextIntake nextIntake;

  const Tick(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class ResetTimer extends TimerEvent{}

class ZeroTimer extends TimerEvent {}
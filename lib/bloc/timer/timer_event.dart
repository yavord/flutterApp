import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class StartTimer extends TimerEvent {
  final double nextIntake;

  const StartTimer(this.nextIntake);

  @override
  List<Object> get props => [];
}

class UpdateTimer extends TimerEvent {
  final double nextIntake;

  const UpdateTimer(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class ZeroTimer extends TimerEvent {}
import 'package:equatable/equatable.dart';
// import 'package:proba123/models/models.dart';
import 'package:meta/meta.dart';


@immutable
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class LoadTimer extends TimerEvent {
  // final double nextIntake;

  // LoadTimer({@required this.nextIntake}) : super([nextIntake]);
}

class UpdateTimer extends TimerEvent {
  final double nextIntake;

  const UpdateTimer(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class ZeroTimer extends TimerEvent {}
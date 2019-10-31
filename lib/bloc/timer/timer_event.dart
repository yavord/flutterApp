import 'package:equatable/equatable.dart';
// import 'package:proba123/models/models.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerEvent extends Equatable {
  const CircleTimerEvent();

  @override
  List<Object> get props => [];
}

class LoadCircleTimer extends CircleTimerEvent {
  // final double nextIntake;

  // LoadCircleTimer({@required this.nextIntake}) : super([nextIntake]);
}

class UpdateCircleTimer extends CircleTimerEvent {
  final double nextIntake;

  const UpdateCircleTimer(this.nextIntake);

  @override
  List<Object> get props => [nextIntake];
}

class ZeroCircleTimer extends CircleTimerEvent {}
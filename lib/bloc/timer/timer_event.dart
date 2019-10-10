import 'package:equatable/equatable.dart';
import 'package:hmss/models/models.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerEvent extends Equatable {
  CircleTimerEvent([List props = const[]]) : super(props);
}

class LoadCircleTimer extends CircleTimerEvent {
  final double nextIntake;

  LoadCircleTimer({@required this.nextIntake}) : super([nextIntake]);
}

class UpdateCircleTimer extends CircleTimerEvent {
  final double nextIntake;

  UpdateCircleTimer({@required this.nextIntake}) : super([nextIntake]);
}

class ZeroCircleTimer extends CircleTimerEvent {}
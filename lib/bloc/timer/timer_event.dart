import 'package:equatable/equatable.dart';
import 'package:hmss/models/models.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerEvent extends Equatable {
  CircleTimerEvent([List props = const[]]) : super(props);
}

class LoadCircleTimer extends CircleTimerEvent {}

class UpdateCircleTimer extends CircleTimerEvent {
  final List<MedTile> medTile;

  UpdateCircleTimer(this.medTile) : super([medTile]);
}

class ZeroCircleTimer extends CircleTimerEvent {}

//TODO: add events for notifications to remind user to take pills based on user settings
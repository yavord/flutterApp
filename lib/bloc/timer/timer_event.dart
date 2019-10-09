import 'package:equatable/equatable.dart';
import 'package:hmss/models/models.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerEvent extends Equatable {
  CircleTimerEvent([List props = const[]]) : super(props);
}

class LoadCircleTimer extends Equatable {}

class UpdateCircleTimer extends Equatable {
  final MedTile medTile;

  UpdateCircleTimer(this.medTile) : super([medTile]);
}

class ZeroCircleTimer extends Equatable {}

//TODO: add events for notifications to remind user to take pills based on user settings
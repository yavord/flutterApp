import 'package:equatable/equatable.dart';
import 'package:hmss/models/models.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerEvent extends Equatable {
  CircleTimerEvent([List props = const[]]) : super(props);
}

class UpdateCircleTimer extends Equatable {
  final MedTile medTile;

  UpdateCircleTimer(this.medTile) : super([medTile]);
}
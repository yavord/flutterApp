import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class CircleTimerEvent extends Equatable {
  CircleTimerEvent([List props = const[]]) : super(props);
}

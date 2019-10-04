import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


//this class is most likely unnecessary
@immutable
class CircleTimer extends Equatable {
  final String time;

  CircleTimer({@required this.time}) :
      super([time]);
}
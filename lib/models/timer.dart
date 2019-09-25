import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


//this class is most likely unnecessary
@immutable
class CircleTimer extends Equatable {
  final String doses;
  final String schedule;

  CircleTimer({@required this.doses, @required this.schedule}) :
      super([doses, schedule]);
}
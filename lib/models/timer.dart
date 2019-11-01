import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


//this class is most likely unnecessary
@immutable
class Timer extends Equatable {
  final String time;

  Timer({@required this.time});

  @override
  List<Object> get props => [time];
}
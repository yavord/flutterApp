import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';


class NextIntake extends Equatable {
  final String schedule;
  final int frequency;
  final DateTime start;

  NextIntake({
    @required this.schedule, 
    @required this.frequency, 
    @required this.start,
    });

  List<Object> get props => [schedule, frequency, start];

  int toMinutes() {
    DateTime toDateTime = DateFormat.Hm().parse(schedule);
    DateTime future = new DateTime.utc(start.year, start.month, start.day+frequency, 
      toDateTime.hour, toDateTime.minute);
    DateTime now = new DateTime.now();
    
    Duration durationFuture = future.difference(now);
    assert(durationFuture.inMinutes>=0);
    return durationFuture.inMinutes;
  }
}
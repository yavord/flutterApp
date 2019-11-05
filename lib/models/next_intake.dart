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
    DateTime now = DateTime.now();

    int nextIntakeDuration = toDateTime.hour*60+toDateTime.minute;
    int nowDuration = now.hour*60+now.minute;

    if(nextIntakeDuration > nowDuration) {
      return nextIntakeDuration - nowDuration;
    }
  }
}
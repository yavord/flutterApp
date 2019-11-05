import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';


class NextIntake extends Equatable {
  final String schedule;
  final int frequency;

  NextIntake({this.schedule, this.frequency});

  List<Object> get props => [schedule, frequency];

  int toMinutes() {
    DateTime toDateTime = DateFormat.Hm().parse(schedule);
    DateTime now = DateTime.now();

    int toDateTimeDuration = toDateTime.hour*60+toDateTime.minute;
    int nowDuration = now.hour*60+now.minute;

    if(toDateTimeDuration > nowDuration) {
      return toDateTimeDuration - nowDuration;
    }
  }
}
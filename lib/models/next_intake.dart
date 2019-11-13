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

  NextIntake copyWith({String schedule, int frequency, DateTime start}) {
    return NextIntake(
      schedule: schedule ?? this.schedule,
      frequency: frequency ?? this.frequency,
      start: start ?? this.start,
    );
  }

  DateTime getFutureDateTime() {
    DateTime toDateTime = DateFormat.Hm().parse(schedule);
    DateTime future = new DateTime.utc(start.year, start.month, start.day+frequency, 
      toDateTime.hour, toDateTime.minute);
    return future;
  }

  int minsRemaining() {
    DateTime future = this.getFutureDateTime();
    DateTime now = new DateTime.now();
    
    Duration durationRemaining = future.difference(now);
    assert(durationRemaining.inMinutes>=0);
    return durationRemaining.inMinutes;
  }

  int minsTotal() {
    DateTime future = this.getFutureDateTime();

    Duration durationTotal = future.difference(start);
    assert(durationTotal.inMinutes>=0);
    return durationTotal.inMinutes;
  }
}

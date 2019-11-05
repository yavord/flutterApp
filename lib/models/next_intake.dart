import 'package:equatable/equatable.dart';


class NextIntake extends Equatable {
  final String schedule;
  final int frequency;

  NextIntake({this.schedule, this.frequency});

  List<Object> get props => [schedule, frequency];

  int toInt() {
  }
}
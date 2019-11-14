import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:proba123/util/uuid.dart';


@immutable
class MedTile extends Equatable {
  final bool complete;
  final String id;
  final String name;
  final String dose;
  final String form;
  final String doses;
  final String schedule;
  final int frequency;
  final DateTime start;

  //TODO: Edit constructors to fit database input/output
  MedTile({
    this.complete = false,
    String id,
    @required this.name,
    @required this.dose,
    @required this.form,
    @required this.doses,
    @required this.schedule,
    @required this.frequency,
    @required this.start,
  }) :
      this.id = id ?? Uuid().generateV4();

  MedTile copyWith({bool complete, String id, String name, 
    String dose, String form, String doses, String schedule, int frequency, DateTime start}) {
    return MedTile(
      complete: complete ?? this.complete,
      id: id ?? this.id,
      name: name ?? this.name,
      dose: dose ?? this.dose,
      form: form ?? this.form,
      doses: doses ?? this.doses,
      schedule: schedule ?? this.schedule,
      frequency: frequency ?? this.frequency,
      start: start ?? this.start,
    );
  }

  @override
  List<Object> get props => [complete, id, name, dose, form, doses, schedule, frequency];

  @override
  String toString() {
    return 'MedTile { $name }';
  }
}
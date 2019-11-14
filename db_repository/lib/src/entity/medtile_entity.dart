import 'package:equatable/equatable.dart';


class MedTileEntity extends Equatable{
  final bool complete;
  final int id;
  final String name;
  final String dose;
  final String form;
  final String doses;
  final String schedule;
  final int frequency;
  final DateTime start;

  const MedTileEntity({
    this.complete,
    this.id,
    this.name,
    this.dose,
    this.form,
    this.doses,
    this.schedule,
    this.frequency,
    this.start,
  });

  @override
  List<Object> get props => [complete, id, name, dose, form, doses, schedule, frequency, start];

  Map<String, Object> toMap(){
    return {
      "complete" : complete,
      "id" : id,
      "name" : name,
      "dose" : dose,
      "form" : form,
      "doses" : doses,
      "schedule" : schedule,
      "frequency" : frequency,
      "start" : start,
    };
  }

  static MedTileEntity fromMap(Map<String, Object> json) {
    return MedTileEntity(
      complete: json["complete"],
      id: json["id"],
      name: json["name"],
      dose: json["dose"],
      form: json["form"],
      doses: json["doses"],
      schedule: json["schedule"],
      frequency: json["frequency"],
      start: json["start"],
    );
  }
}

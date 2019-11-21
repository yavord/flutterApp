import 'package:equatable/equatable.dart';


class MedTileEntity extends Equatable{
  final int id;
  final String name;
  final String dose;
  final String form;
  final String doses;
  final String schedule;
  final int frequency;
  final String start;

  const MedTileEntity({
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
  List<Object> get props => [id, name, dose, form, doses, schedule, frequency, start];

  Map<String, Object> toMap(){
    return {
      "id" : this.id,
      "name" : this.name,
      "dose" : this.dose,
      "form" : this.form,
      "doses" : this.doses,
      "schedule" : this.schedule,
      "frequency" : this.frequency,
      "start" : this.start,
    };
  }

  static MedTileEntity fromMap(Map<String, Object> json) {
    return MedTileEntity(
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

  @override
  String toString() => 'MedTileEntity { $name }';
}

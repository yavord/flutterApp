import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:db_repo/src/entity/medtile_entity.dart';


@immutable
class MedTile extends Equatable {
  final int id;
  final String name;
  final String dose;
  final String form;
  final String doses;
  final String schedule;
  final int frequency;
  final DateTime start;

  MedTile({
    @required this.id,
    @required this.name,
    @required this.dose,
    @required this.form,
    @required this.doses,
    @required this.schedule,
    @required this.frequency,
    @required this.start,
  });
      // this.id = id ?? Uuid().generateV4();

  @override
  List<Object> get props => [id, name, dose, form, doses, schedule, frequency];

  MedTile copyWith({int id, String name, 
    String dose, String form, String doses, String schedule, int frequency, DateTime start}) {
    return MedTile(
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

  MedTileEntity toEntity() {
    return MedTileEntity(
      id: id,
      name: name,
      dose: dose,
      form: form,
      doses: doses,
      schedule: schedule,
      frequency: frequency,
      start: start,
    );
  }

  static MedTile fromEntity(MedTileEntity entity) {
    return MedTile(
      id: entity.id,
      name: entity.name,
      dose: entity.dose,
      form: entity.form,
      doses: entity.doses,
      schedule: entity.schedule,
      frequency: entity.frequency,
      start: entity.start,
    );
  }

  @override
  String toString() => 'MedTile { $name }';
}
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

  //TODO: Edit constructors to fit database input/output
  MedTile({
    this.complete = false,
    String id,
    @required this.name,
    @required this.dose,
    @required this.form,
    @required this.doses,
    @required this.schedule,
  }) :
        this.id = id ?? Uuid().generateV4(),
        super([complete, name, dose, form, doses, schedule]);

  MedTile copyWith({bool complete, String id, String name, 
    String dose, String form, String doses, String schedule,}) {
    return MedTile(
      complete: complete ?? this.complete,
      id: id ?? this.id,
      name: name ?? this.name,
      dose: dose ?? this.dose,
      form: form ?? this.form,
      doses: doses ?? this.doses,
      schedule: schedule ?? this.schedule,
    );
  }

  //TODO: fit to API
  Map<String, Object> toEntity() {
    return {
      "complete" : complete,
      "name" : name,
      "dose" : dose,
      "form" : form,
      "doses" : doses,
      "schedule" : schedule,
    };
  }

  //TODO: fit to API
//  static MedTile fromEntity(Map<String, Object> entity) {
//    return MedTile();
//  }
}
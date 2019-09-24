import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class MedTile extends Equatable {
  final bool complete;
//  final String id;
  final String name;
  final String dose;
  final String form;
  final String doses;
  final String schedule;

  //TODO: Edit constructors to fit database input/output
  MedTile({
    this.complete = false,
//    @required this.id,
    @required this.name,
    @required this.dose,
    @required this.form,
    @required this.doses,
    @required this.schedule,
  }) : super([complete, name, dose, form, doses, schedule]);

  Map dataMap = {
    "name" : name,
    "dose" : dose,
    "form" : form,
    "doses" : doses,
    "schedule" : schedule,
  };

  //TODO: fit this to API
//  List<Map> toEntity() {
//    return MedTileEntity();
//  }

  //TODO: implement this
//  static MedTile fromEntity(MedTile entity) {
//    return MedTile(
//      entity.
//    )
//  }
}
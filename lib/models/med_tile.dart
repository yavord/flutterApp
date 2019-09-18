import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class MedTile extends Equatable {
  final bool complete;
  final String name;
  final String dose;
  final String form;
  final String doses;
  final String schedule;

  //TODO: Edit constructors to fit database input/output
  MedTile({
    this.complete = false,
    @required this.name,
    this.dose,
    this.form,
    this.doses,
    this.schedule
  }) : super([complete, name, dose, form, doses, schedule]);

  //TODO: implement MedTileEntity
//  MedTileEntity toEntity() {
//    return MedTileEntity(name, dose, form, doses, schedule);
//  }

  //TODO: implement this thing
//  static MedTile fromEntity(MedTileEntity entity) {
//    return MedTile(
//      entity.
//    )
//  }
}
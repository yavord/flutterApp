import 'package:hmss/models/med_tile.dart';
import 'package:hmss/util/uuid.dart';



//@immutable
//class MedTileEntity extends Equatable {
//  final bool complete;
//  final String name;
//  final String form;
//  final String dose;
//  final String doses;
//  final String schedule;
//
//  MedTileEntity({this.complete, this.name, this.form, this.dose, this.doses, this.schedule});
//}

String name = "Miro Mutti";

List<MedTile> medications = [
  MedTile(
    complete: true,
    id: Uuid().generateV4(),
    name: "Aerius 5mg",
    form: "tablet",
    dose: "1",
    doses: "6",
    schedule: "7:00",
  ),
  MedTile(
    complete: true,
    id: Uuid().generateV4(),
    name: "Paracetamol",
    form: "tablet",
    dose: "1",
    doses: "10",
    schedule: "20:30",
  ),
];


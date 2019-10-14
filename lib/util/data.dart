import 'package:proba123/models/models.dart';
import 'package:proba123/util/uuid.dart';



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
    complete: false,
    id: Uuid().generateV4(),
    name: "Aerius 5mg",
    form: "tablet",
    dose: "1",
    doses: "6",
    schedule: "7:00",
  ),
  MedTile(
    complete: false,
    id: Uuid().generateV4(),
    name: "Paracetamol",
    form: "tablet",
    dose: "1",
    doses: "10",
    schedule: "20:30",
  ),
  MedTile(
    complete: false,
    id: Uuid().generateV4(),
    name: 'Аспиринец',
    form: 'tablet',
    dose: '2',
    doses: '20',
    schedule: '14:20',
  ),
];


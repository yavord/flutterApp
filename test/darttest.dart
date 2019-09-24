//import 'package:hmss/models/med_tile.dart';
//import 'package:hmss/bloc/med_tile/med_tile.dart';
import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class MedTileEntity extends Equatable {
  final bool complete;
  final String name;
  final String form;
  final String dose;
  final String doses;
  final String schedule;

  MedTileEntity(this.complete, this.name, this.form, this.dose, this.doses, this.schedule);
}

List<Map<String, String>> medications = [
  {
    "name": "Aerius 5mg",
    "form": "tablet",
    "dose": "1",
    "doses": "6",
    "schedule": "7:00",
  },
  {
    "name": "Paracetamol",
    "form": "tablet",
    "dose": "1",
    "doses": "10",
    "schedule": "20:30",
  },
];

//final List<MedTile> updated =

main() {
  var rng = Random();
  print(rng.nextInt(400));
}